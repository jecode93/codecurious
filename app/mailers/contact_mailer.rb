class ContactMailer < ApplicationMailer
  default to: Rails.application.credentials.dig(:mailing, :default_to)

  def new_message(contact)
    @contact = contact
    mail("reply-to": contact.email, subject: "New message from CodeCurious", from: contact.email)
  end
end
