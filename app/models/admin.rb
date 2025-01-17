class Admin < ApplicationRecord
  extend FriendlyId

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable

  has_many :articles, foreign_key: "author_id", dependent: :destroy

  friendly_id :name, use: %i[slugged history finders]
end
