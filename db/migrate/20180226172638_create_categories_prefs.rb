class CreateCategoriesPrefs < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_prefs do |t|
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
