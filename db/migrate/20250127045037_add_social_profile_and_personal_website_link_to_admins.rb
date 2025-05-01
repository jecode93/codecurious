class AddSocialProfileAndPersonalWebsiteLinkToAdmins < ActiveRecord::Migration[8.0]
  def change
    add_column :admins, :website, :string
    add_column :admins, :whatsapp_number, :integer
    add_column :admins, :github, :string
    add_column :admins, :linkedin, :string
    add_column :admins, :facebook, :string
    add_column :admins, :instagram, :string
  end
end
