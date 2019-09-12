require 'rails_helper'
RSpec.describe User, type: :model do
    let(:valid_attributes) do {
        username: 'name',
        display_name: 'display',
        age: '25',
        bio: 'this is a user bio!',
        email: 'name@display.com',
        is_deleted: false
    }
    end

    let(:no_username) {valid_attributes.except(:username)}

    it 'is not valid without a username' do
      expect(User.new(no_username)).not_to be_valid
    end
    it 'is valid if password and password_confirmation match' do
      user = User.new(valid_attributes)
      user.password = user.password_confirmation = 'foo'
      expect(user.valid?).to be true    
    end
end