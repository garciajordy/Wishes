require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Test for invalid user' do
    it 'returns false if not all params are filled in.' do
      @user = User.create(name: '')
      expect(@user).to_not be_valid
    end
    it 'returns false if name is already taken.' do
      @user = User.create(name: 'jordy')
      @user1 = User.create(name: 'jordy')
      expect(@user1).to_not be_valid
    end
    it 'returns true if name is filled in and not taken.' do
      @user = User.create(name: 'jordy')
      expect(@user).to be_valid
    end
  end

  context 'testing scopes' do
    before do
      @user = User.create(name: 'jordy')
      @group = @user.groups.create(name: 'Microverse', icon: 'link')
      Wishlist.create(group_id: @group.id, author_id: @user.id, name: 'Ruby', amount: 15)
      Wishlist.create(group_id: @group.id, author_id: @user.id, name: 'Ruby', amount: 15)
      Wishlist.create(group_id: @group.id, author_id: @user.id, name: 'Ruby', amount: 15)
    end
    it 'returns sum of all wishes to be 45$' do
      expect(@user.wishes.sum(:amount)).to eq(45)
    end
    it 'returns count of all wishes to be 3' do
      expect(@user.wishes.count).to eq(3)
    end
  end
end
