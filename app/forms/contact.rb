class Contact
  include ActiveModel::Model

  attr_accessor :email, :subject, :message

  validates :email, :subject, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
