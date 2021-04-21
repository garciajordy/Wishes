# frozen_string_literal: true

class Wishlist < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :group
  has_many :payments
end
