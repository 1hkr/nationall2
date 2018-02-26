class Article < ApplicationRecord
  belongs_to :user_id
  belongs_to :category_id
end
