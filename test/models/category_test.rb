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

require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
