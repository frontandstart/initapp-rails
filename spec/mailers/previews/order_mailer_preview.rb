# Preview all emails at http://localhost:3000/rails/mailers/order_mailer_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer_mailer/new_order_notification
  def new_order_notification
    OrderMailer.new_order_notification
  end

end
