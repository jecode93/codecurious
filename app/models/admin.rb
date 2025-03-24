class Admin < ApplicationRecord
  extend FriendlyId

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable

  enum :role, { super_admin: "super_admin", admin: "admin", editor: "editor" }, default: :editor

  has_many :articles, foreign_key: "author_id", dependent: :destroy
  has_one_attached :profile_picture

  validates :name, presence: true, length: { maximum: 50 }

  validates :whatsapp_number, format: {
    with: /\A\+?[0-9]{10,15}\z/,
    message: "should be a valid WhatsApp number (only digits, optionally starting with '+')"
  }, allow_blank: true

  validates :github, format: {
    with: /\A[a-zA-Z0-9](?:-?[a-zA-Z0-9]){0,38}\z/,
    message: "should be a valid GitHub username (without the domain or the '@' symbol)"
  }, allow_blank: true

  validates :facebook, format: {
    with: /\A[a-zA-Z0-9\.]+\z/,
    message: "should be a valid Facebook username (without the domain or the '@' symbol)"
  }, length: { in: 5..50 }, allow_blank: true

  validates :linkedin, format: {
    with: /\A[a-zA-Z0-9-]+\z/,
    message: "should be a valid LinkedIn username (without the domain)"
  }, length: { in: 5..30 }, allow_blank: true

  validates :instagram, format: {
    with: /\A[a-zA-Z0-9_.]+\z/,
    message: "should be a valid Instagram username (without the domain or the '@' symbol)"
  }, length: { maximum: 30 }, allow_blank: true

  validates :website, format: {
    with: /\A(http:\/\/|https:\/\/)?[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]+)+\z/,
    message: "should be a valid website URL"
  }, allow_blank: true

  friendly_id :name, use: %i[slugged history finders]

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
