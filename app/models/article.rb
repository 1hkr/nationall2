class Article < ApplicationRecord
  belongs_to :user_id
  belongs_to :category_id

  has_many :donations, dependent: :nullify
  has_many :users, through: :donations
  has_many :reviews, dependent: :destroy
  has_many :opinions, dependent: :destroy

  validates :title, :subtitle, :content, :picture, presence: true
  validates :summary, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
end
