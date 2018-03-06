class Review < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :rating, presence:true
  validates :rating, inclusion: { in: [1,2,3,4,5] }
  validates :emotion, inclusion: { in: [1,2] }
  validates :temperature, inclusion: { in: [1,2,3,4] }

  after_create :calculate_avg_rating

  private

  def calculate_avg_rating
    ratings = []
    self.article.reviews.each do |review|
      ratings << review.rating
    end
    avg = ratings.inject{ |sum, el| sum + el }.to_f / ratings.size
    self.article.update(avg_rating: avg)
  end
end
