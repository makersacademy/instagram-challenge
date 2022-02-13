require "rails_helper"
require 'validates_email_format_of/rspec_matcher'

RSpec.describe User, type: :model do
  before(:each) do
    vailid_user = User.create(
      {name: 'test name',
       usernname: 'test username', 
       email: 'test@test.com', 
       password: '123456'}
    )

  end

  let(:valid_user) { User.all.first }
  
  context("User can be created with vaild information") do
    it "Users can be created" do
      expect(User.all.length).to eq(1)
    end

    it "User has a name" do
      expect(valid_user.name).to eq('test name')
    end

    it "User has a username" do
      expect(valid_user.usernname).to eq('test username')
    end

    it "User has a vaild email" do
      expect(valid_user.validate('test@test.com')).to be_truthy
    end

    it "user has valid password" do
      expect(valid_user.valid_password?('123456')).to be_truthy
    end
  end

  context("User cannot be created with invalid information") do

    it 'will not accept an invail email format' do
      expect(User.new({usernname: 'username', name: 'name', password: 'password', email: 'not_an_email'}).valid?).to be_falsey
    end

    it 'will not accept a pre-existing email ' do
      User.create({usernname: 'username', name: 'name', password: 'password', email: 't@test.com'})
      expect(User.new({usernname: 'username', name: 'name', password: 'password', email: 't@test.com'}).valid?).to be_falsey
    end

    it 'is invalid if password is too short' do
      expect(User.new({usernname: 'username', name: 'name', password: 'pass', email:' e@mail.com'}).valid?).to be_falsey
    end

    it 'is invalid if password is too long' do
      expect(User.new({usernname: 'username', name: 'name', password: 'passwordistoolong', email:' e@mail.com'}).valid?).to be_falsey
    end
  end
end

