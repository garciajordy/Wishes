class Group < ApplicationRecord
  belongs_to :user
  has_many :wishlists
  validates :name, presence: true
end
