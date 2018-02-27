class Category < ApplicationRecord
  has_many :articles
  has_many :categories_pref

  validates :name, presence: true, uniqueness: true
end
