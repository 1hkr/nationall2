class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :article
  monetize :amount_cents
end
