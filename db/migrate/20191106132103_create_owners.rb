class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.integer :github_id

      t.string  :login
      t.string  :url
      t.string  :html_url
      t.string  :avatar_url
      t.string  :type

      t.boolean :site_admin

      t.timestamps
    end
  end
end
