require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  context 'Test for invalid wishlist' do
    before do
      @user = User.create(name: 'jordy')
      @group = Group.create(name: 'Microverse')
    end
    it 'returns false if name is not filled in.' do
      @wishlist = Wishlist.create(name: '', amount: 15, author_id: @user.id, group_id: @group.id)
      expect(@wishlist).to_not be_valid
    end

    it 'returns false if amount is not filled in.' do
      @wishlist = Wishlist.create(name: 'Ruby', author_id: @user.id, group_id: @group.id)
      expect(@wishlist).to_not be_valid
    end

    it 'returns false if user doesn\'t exist.' do
      @user2 = User.create
      @wishlist = Wishlist.create(name: 'Ruby', amount: 15, author_id: @user2.id, group_id: @group.id)
      expect(@wishlist).to_not be_valid
    end

    it 'returns false if group doesn\'t exist.' do
      @group2 = Group.create
      @wishlist = Wishlist.create(name: 'Ruby', amount: 15, author_id: @user.id, group_id: @group2.id)
      expect(@wishlist).to_not be_valid
    end
  end
end
