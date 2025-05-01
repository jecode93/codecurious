class CreateArticleReadCounts < ActiveRecord::Migration[8.0]
  def change
    create_table :article_read_counts do |t|
      t.references :article, null: false, foreign_key: true
      t.datetime :read_at

      t.timestamps
    end
  end
end
