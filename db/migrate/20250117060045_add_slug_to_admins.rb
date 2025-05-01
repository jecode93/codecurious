class AddSlugToAdmins < ActiveRecord::Migration[8.0]
  def change
    add_column :admins, :slug, :string
    add_index :admins, :slug, unique: true
  end
end
