class Admin < ApplicationRecord
  extend FriendlyId

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable

  has_many :articles, foreign_key: "author_id", dependent: :destroy
  has_one_attached :profile_picture

  friendly_id :name, use: %i[slugged history finders]

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end
end
