require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'will be valid if name and email are provided' do

    it "will take in a name and email" do
      user = User.new(name: 'example', email: 'test@email.com')

      expect(user).to respond_to(:name)
      expect(user.name).to eq 'example'
      expect(user).to respond_to(:email)
      expect(user.email).to eq 'test@email.com'
    end
  end

  describe 'is invalid if name not provided' do
    before :each do
      user = User.new(name: '', email: 'test@email.com')
    end

    it { should_not be_valid }
  end

  describe 'is invalid if email is not provided' do
    before :each do
      user = User.new(name: 'example', email: '')
    end

    it { should_not be_valid }
  end

  describe 'is invalid if name is over 50 char' do
    before :each do
      long_name = 'a' * 51
      user = User.new(name: long_name, email: 'test@email.com')

      it { should_not be_valid }
    end
  end
end
