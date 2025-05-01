class AddStatusToArticle < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :status, :string, default: "draft"
  end
end
