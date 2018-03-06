class AddAverageRatingOnArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :avg_rating, :integer
  end
end
