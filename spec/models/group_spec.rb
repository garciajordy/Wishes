require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'Test for invalid group' do
    before do
      @user = User.create(name: 'jordy')
    end
    it 'returns false if name is not filled in.' do
      @group = @user.groups.create(icon: 'link')
      expect(@group).to_not be_valid
    end

    it 'returns true if name is filled in but not icon.' do
      @group = @user.groups.create(name: 'Microverse')
      expect(@group).to be_valid
    end

    it 'returns true if name and icon are filled in.' do
      @group = @user.groups.create(name: 'Microverse', icon: 'link')
      expect(@group).to be_valid
    end
  end
end
