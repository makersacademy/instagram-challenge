require "rails_helper"

RSpec.describe User, :type => :model do
  context "new user created" do
    before(:each) do
      new_user = User.create(
        email: 'test@example.com', 
        password: 'password123',
        password_confirmation: 'password123'
      )
    end

    it "Users can be created" do
      user = User.all
      expect(user[0].email).to eq 'test@example.com'
    end

    it "user has valid password" do
      user = User.all
      expect(user[0].valid_password?('password123')).to be_truthy
    end
  end
end