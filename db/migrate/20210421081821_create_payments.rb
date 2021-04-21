# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :wishlist, null: false, foreign_key: true
      t.boolean :paid

      t.timestamps
    end
  end
end
