class AddAverageTemperatureOnArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :avg_temperature, :integer
  end
end
