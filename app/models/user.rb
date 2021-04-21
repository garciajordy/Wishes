# frozen_string_literal: true

class User < ApplicationRecord
  has_many :groups
  has_many :wishes, foreign_key: 'author_id', class_name: 'Wishlist'
  has_many :payments
  validates :name, presence: true, uniqueness: true
end
