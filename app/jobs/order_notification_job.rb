class OrderNotificationJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    order = Order.find(order_id)
    
    # Отправляем email уведомление
    OrderMailer.new_order_notification(order).deliver_now
    
    # Отправляем уведомление в Telegram (если настроен)
    send_telegram_notification(order) if telegram_configured?
    
  rescue ActiveRecord::RecordNotFound
    Rails.logger.error "Order with ID #{order_id} not found"
  rescue => e
    Rails.logger.error "Failed to send notifications for order #{order_id}: #{e.message}"
    raise e
  end

  private

  def send_telegram_notification(order)
    return unless ENV['TELEGRAM_BOT_TOKEN'] && ENV['TELEGRAM_CHAT_ID']

    message = build_telegram_message(order)
    
    uri = URI("https://api.telegram.org/bot#{ENV['TELEGRAM_BOT_TOKEN']}/sendMessage")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    
    request = Net::HTTP::Post.new(uri)
    request['Content-Type'] = 'application/json'
    request.body = {
      chat_id: ENV['TELEGRAM_CHAT_ID'],
      text: message,
      parse_mode: 'HTML'
    }.to_json
    
    response = http.request(request)
    
    unless response.code == '200'
      Rails.logger.error "Failed to send Telegram notification: #{response.body}"
    end
  end

  def build_telegram_message(order)
    <<~MESSAGE
      🔔 <b>Новая заявка на сайте!</b>
      
      👤 <b>Имя:</b> #{order.name}
      📧 <b>Email:</b> #{order.email}
      📱 <b>Телефон:</b> #{order.formatted_phone}
      🎯 <b>Тип проекта:</b> #{order.project_type_name}
      
      💬 <b>Сообщение:</b>
      #{order.message.present? ? order.message : 'Не указано'}
      
      📅 <b>Дата:</b> #{order.created_at.strftime('%d.%m.%Y %H:%M')}
      
      #заявка #новый_клиент
    MESSAGE
  end

  def telegram_configured?
    ENV['TELEGRAM_BOT_TOKEN'].present? && ENV['TELEGRAM_CHAT_ID'].present?
  end
end
