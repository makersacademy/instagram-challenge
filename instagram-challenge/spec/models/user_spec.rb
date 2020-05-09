require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validating user name ' do 
    # better way to describe this it block? 
    it " user name 'gina' user should be valid" do
      user = User.new(name: 'gina', email: 'gina@example.com')
      expect(user).to be_valid
    end 

    it 'user should only  be valid if name is entered' do 
      expect(User.new(email: 'gina@example.com')).to_not be_valid
    end 

    it 'user should only  be valid if name is entered' do 
      user = User.new(name: '', email: 'gina@example.com')
      expect(user).to_not be_valid
    end 

    it 'name should not be too long' do
      long_name = 'g' * 51
      user = User.new(name: long_name, email: 'gina@example.com')
      expect(user).to_not be_valid
    end
  end
  describe 'validating user email ' do 
    it 'standard email should be valid' do 
      user = User.new(name: 'gina', email: 'gina@example.com')
      expect(user).to be_valid
    end 

    it 'user will not be valid if no email address is entered' do 
      user = User.new(name: 'gina', email: "")
      expect(user).to_not be_valid
    end 

  end 
end


