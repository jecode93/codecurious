# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  slug        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  admin_id    :integer          not null
#
# Indexes
#
#  index_categories_on_admin_id  (admin_id)
#  index_categories_on_name      (name) UNIQUE
#  index_categories_on_slug      (slug) UNIQUE
#

class Category < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: %i[slugged history finders]

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  belongs_to :admin
  has_many :article_categories, dependent: :destroy
  has_many :articles, through: :article_categories

  validates :name, :slug, presence: true, uniqueness: true
end
