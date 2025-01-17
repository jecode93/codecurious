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
  belongs_to :author, class_name: "Admin", foreign_key: "author_id"
  has_one_attached :featured_image
end
