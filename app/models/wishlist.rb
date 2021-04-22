class Wishlist < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :payments
  has_one :group
  validates :name, presence: true
  validates :amount, presence: true
end
