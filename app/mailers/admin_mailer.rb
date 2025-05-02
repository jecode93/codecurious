class AdminMailer < ApplicationMailer
  def welcome_email(admin, generate_password)
    @admin = admin
    @password = generate_password
    @url = Rails.application.credentials.dig(:mailing, :login_url)
    mail(to: @admin.email, subject: "Welcome to CodeCurious - #{@admin.name.titleize}")
  end
end
