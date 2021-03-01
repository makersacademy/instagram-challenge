
require './spec/rails_help'

RSpec.describe User, type: :model do
  # let (:user) { User.create({email: "test@email.com", password: "testPassword",  password_confirmation: "testPassword" }) }
  describe '#create' do
    
    it 'creates a user with a password, and email' do
      user = User.create({first_name: "Joe", last_name: "Bloggs", email: "test@anotheremail.com", password: "password",  password_confirmation: "password" })
      expect(User.first.email).to eq("test@anotheremail.com")
    end

  end
end