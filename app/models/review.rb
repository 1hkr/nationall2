class Review < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :rating, :emotion, :temperature, presence:true
  validates :rating, inclusion: { in: [1,2,3,4,5] }
  validates :emotion, inclusion: { in: [1,2] }
  validates :temperature, inclusion: { in: [1,2,3,4] }

  after_save :calculate_avg_rating, :calculate_avg_emotion, :calculate_avg_temperature
  # after_create / save choose an appropriate one.
  #  only a review instance can be passed to the method below.
 # after_create sets a review instance to def calculate...
  private

  def calculate_avg_rating
    ratings = []
    article.reviews.each do |review|
      ratings << review.rating
    end
    avg = ratings.inject{ |sum, el| sum + el }.to_f / ratings.size
    article.update(avg_rating: avg)
  end

  def calculate_avg_emotion
    emotions = []
    article.reviews.each do |review|
      emotions << review.emotion
    end
    avg = emotions.inject{ |sum, el| sum + el }.to_f / emotions.size
    article.update(avg_emotion: avg)
  end

  def calculate_avg_temperature
    temperatures = []
    article.reviews.each do |review|
      temperatures << review.temperature
    end
    avg = temperatures.inject{ |sum, el| sum + el }.to_f / temperatures.size
    article.update(avg_temperature: avg)
  end
end
