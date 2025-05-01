class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(:mailing, :default_from)
  layout "mailer"
end
