# == Schema Information
#
# Table name: article_read_counts
#
#  id         :integer          not null, primary key
#  article_id :integer          not null
#  read_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_article_read_counts_on_article_id  (article_id)
#

class ArticleReadCount < ApplicationRecord
  belongs_to :article
end
