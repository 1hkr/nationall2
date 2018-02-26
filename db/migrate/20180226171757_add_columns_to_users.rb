class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :bio, :text
    add_column :users, :picture, :string
    add_column :users, :emotion_pref, :string
    add_column :users, :temperature_pref, :string
    add_column :users, :badge, :string
    add_column :users, :link, :string
  end
end
