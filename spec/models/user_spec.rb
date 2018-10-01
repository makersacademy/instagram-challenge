require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'User variables' do
    before(:each) do
      @user = User.create({ first_name: 'Tess', 
                           last_name: 'Tester', 
                           email: 'tess@tester.com', 
                           password: 'secure' })
    end

    it 'has a first name' do
      expect(@user.first_name).to be
    end
    it 'has a last name' do
      expect(@user.last_name).to be
    end
    it 'has an email' do
      expect(@user.email).to be
    end
    it 'has a password' do
      expect(@user.password).to be
    end
    it 'has an id' do
      expect(@user.id).to be
    end
  end

  describe 'when registering' do
    it 'must have a first name' do
      @user = User.create({ last_name: 'Tester', 
                            email: 'tess@tester.com', 
                            password: 'secure' })
      expect(User.all[0]).not_to be
    end
    it 'must have a last name' do
      @user = User.create({ first_name: 'Tess', 
                            email: 'tess@tester.com', 
                            password: 'secure' })
      expect(User.all[0]).not_to be
    end
    it 'must have an email' do
      @user = User.create({ first_name: 'Tess', 
                            last_name: 'Tester',
                            password: 'secure' })
      expect(User.all[0]).not_to be
    end
    it 'must have a password' do
      @user = User.create({ first_name: 'Tess', 
                            last_name: 'Tester', 
                            email: 'tess@tester.com' })
      expect(User.all[0]).not_to be
    end
  end
end
