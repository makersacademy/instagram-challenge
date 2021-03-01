require 'rails_helper'


RSpec.describe User, type: :model do
  # let (:user) { User.create({email: "test@email.com", password: "testPassword",  password_confirmation: "testPassword" }) }
  describe '#create' do
    
    it 'creates a user with a password, and email' do
      User.create({email: "test@anotheremail.com", password: "testPassword",  password_confirmation: "testPassword" })
      expect(User.first.email).to eq("test@anotheremail.com")
    end
    
  end
end
