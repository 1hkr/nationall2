class Review < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :rating, :emotion, :temperature, presence:true
  validates :rating, inclusion: { in: [1,2,3,4,5] }
  validates :emotion, inclusion: { in: [1,2] }
  validates :temperature, inclusion: { in: [1,2,3,4] }
end
