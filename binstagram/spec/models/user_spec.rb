require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Valid set up' do

    it "will take in a name and email" do
      user = User.new(name: 'example', email: 'test@email.com')

      expect(user).to respond_to(:name)
      expect(user.name).to eq 'example'
      expect(user).to respond_to(:email)
      expect(user.email).to eq 'test@email.com'
    end
  end

  describe 'user is invalid'
    before :each do
      user = User.new(name: '', email: 'test@email.com')
    end

    it { should_not be_valid }
end
