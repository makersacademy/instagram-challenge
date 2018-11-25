require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#login' do
    it 'returns an empty string if not logged in' do
      user = User.new
      expect(user.login).to eq ""
    end
  end

  describe '.find_for_database_authentication' do
    let(:email) { "user@user.com" }
    let(:warden_conditions) { { email: email } }

    it "finds user by email" do
      user = User.create(username: email, email: email, password: "password")
      authenticated = User.find_for_database_authentication(warden_conditions)
      expect(authenticated).to eql user
    end

    it "finds user by username" do
      user = User.create(username: email, email: email, password: "password")
      authenticated = User.find_for_database_authentication(warden_conditions)
      expect(authenticated).to eql user
    end
  end
end
