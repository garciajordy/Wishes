class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :wishlist
end
