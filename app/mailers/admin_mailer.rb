class AdminMailer < ApplicationMailer
  def welcome_email(admin, generate_password)
    @admin = admin
    @password = generate_password
    @url = "http://admin.lvh.me:3000/login"
    mail(to: @admin.email, subject: "Welcome to CodeCurious - #{@admin.name.titleize}")
  end
end
