class Opinion < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :content, presence:true
end
