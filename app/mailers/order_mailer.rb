class OrderMailer < ApplicationMailer
  default from: 'noreply@rubyvkube.ru'

  def new_order_notification(order)
    @order = order
    @admin_email = ENV['ADMIN_EMAIL'] || 'admin@rubyvkube.ru'
    
    mail(
      to: @admin_email,
      subject: "Новая заявка от #{@order.name} - #{@order.project_type_name}",
      reply_to: @order.email
    )
  end
end
