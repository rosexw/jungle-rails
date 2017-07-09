# https://launchschool.com/blog/handling-emails-in-rails

class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt(order)
    @order = order
    @url = 'http://localhost:3000/login'
    mail(to: @order.email, subject: 'Thank you for your order!')
end
