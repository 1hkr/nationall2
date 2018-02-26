class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.text :summary
      t.text :content
      t.string :picture
      t.date :publishing_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
