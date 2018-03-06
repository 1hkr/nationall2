class AddAverageEmotionOnArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :avg_emotion, :integer
  end
end
