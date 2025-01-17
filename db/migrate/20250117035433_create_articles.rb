class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.references :author, null: false, foreign_key: { to_table: :admins }

      t.timestamps
    end
    add_index :articles, :slug, unique: true
  end
end
