# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  slug       :string
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_articles_on_author_id  (author_id)
#  index_articles_on_slug       (slug) UNIQUE
#

class Article < ApplicationRecord
  extend FriendlyId

  belongs_to :author, class_name: "Admin", foreign_key: "author_id"
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories
  has_many :article_read_counts, dependent: :destroy

  has_one_attached :featured_image, dependent: :destroy
  has_rich_text :content

  enum :status, { published: "published", draft: "draft", archived: "archived" }, default: :draft

  scope :published, -> { where(status: "published") }
  scope :draft, -> { where(status: "draft") }
  scope :archived, -> { where(status: "archived") }

  validates :title, :author, :slug, :content, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum: 60, too_long: "%{count} characters is the maximum allowed" }

  friendly_id :title, use: %i[slugged history finders]

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  scope :descending_order, -> { order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    ["title", "slug"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
