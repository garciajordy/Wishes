# frozen_string_literal: true

class ChangeUserIdToAuthorIdInWishlist < ActiveRecord::Migration[6.1]
  def change
    rename_column :wishlists, :user_id, :author_id
  end
end
