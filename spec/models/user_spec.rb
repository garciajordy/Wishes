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
end
