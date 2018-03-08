class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :donations, dependent: :nullify
  has_many :users, through: :donations
  has_many :reviews, dependent: :destroy
  has_many :opinions, dependent: :destroy

  validates :title, :subtitle, :content, :picture, presence: true
  validates :summary, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }

  def self.this_categories_first(emotion, temperature, categories)
    # emotion statement
    specific_emotion = "CASE WHEN avg_emotion = #{emotion} THEN 0 ELSE 1 END"
    # temperature statement
    specific_temperature = "CASE WHEN avg_temperature = #{temperature} THEN 0 ELSE 1 END"
    # categories statement
    statement = ["CASE"]
    categories.each_with_index do |category, index|
      statement << "WHEN category_id = #{category.id} THEN #{index}"
    end
    statement << "ELSE #{categories.length} END"
    specific_order = statement.join(" ")
    whole_statement = [specific_emotion, specific_temperature, specific_order].join(", ")
    order(whole_statement)
  end
end
