# https://launchschool.com/blog/handling-emails-in-rails

class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt(order)
    @order = order
    mail(to: @order.email, subject: 'Your New Order Receipt')
end
