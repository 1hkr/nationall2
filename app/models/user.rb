class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_many :articles, through: :donations
  has_many :donations, dependent: :destroy
  has_many :reviews
  has_many :opinions
  has_many :categories_pref
  has_many :categories, through: :categories_pref


  validates :bio, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :emotion_pref, inclusion: { in: [1, 2] }
  validates :temperature_pref, inclusion: { in: [1,2,3,4] }
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

end
