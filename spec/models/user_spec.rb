require 'rails_helper'

RSpec.describe User do
  it { is_expected.to be }

  it 'Should reject user that is missing username' do
    user = User.create( { email: 'test@testmail.com', password: "test123", password_confirmation: "test123" } )
    expect(user.valid?).to eq false;
  end

  it 'Should reject user that is missing email' do
    user = User.create( { username: 'Andy', password: "test123", password_confirmation: "test123" } )
    expect(user.valid?).to eq false;
  end

  it 'Should reject user with email longer than 250 characters' do
    user = User.create( { username: 'Andy', email: ("a" * 242) + '@testemail.com', password: "test123", password_confirmation: "test123" } )
    expect(user.valid?).to eq false;
  end

  it 'Should reject user with username longer than 50 characters' do
    user = User.create( { username: 'a' * 51, email: 'test@testmail.com', password: "test123", password_confirmation: "test123" } )
    expect(user.valid?).to eq false;
  end

  it 'Should reject user with non valid email format' do
    user = User.create( { username: 'Andy', email: 'testtestmail.com', password: "test123", password_confirmation: "test123" } )
    expect(user.valid?).to eq false;
  end

  it 'Should reject new user if email is not unique in users table' do
    user = User.create( { username: 'Andy', email: 'test@testmail.com', password: "test123", password_confirmation: "test123" } )
    expect(user.valid?).to eq true;
    user2 = User.create( { username: 'Andy 2', email: 'test@testmail.com', password: "test123", password_confirmation: "test123" } )
    expect(user2.valid?).to eq false;
  end

  it 'Should accept valid username and email' do
    user = User.create( { username: 'Andy', email: 'test@testmail.com', password: "test123", password_confirmation: "test123" } )
    expect(user.valid?).to eq true;
  end

  it 'Should downcase email addresses before storing in users table' do
    user = User.create( { username: 'Andy', email: 'TEST@testmail.com', password: "test123", password_confirmation: "test123" } )
    user_from_table = User.find_by(username: 'Andy')
    expect(user.email).to eq user_from_table.email
  end

  it 'Should reject user if password does not match password_confirmation' do
    user = User.create( { username: 'Andy', email: 'TEST@testmail.com', password: "test123", password_confirmation: "oops123" } )
    expect(user.valid?).to eq false
  end

  it 'Should reject user if password length below 6' do
    user = User.create( { username: 'Andy', email: 'TEST@testmail.com', password: "test1", password_confirmation: "test1" } )
    expect(user.valid?).to eq false
  end

  it 'Should reject user if password length above 15' do
    user1 = User.create( { username: 'Andy', email: 'TEST@testmail.com', password: "acclimatisation", password_confirmation: "acclimatisation" } )
    expect(user1.valid?).to eq true
    user2 = User.create( { username: 'Andy2', email: 'TEST2@testmail.com', password: "agriculturalists", password_confirmation: "agriculturalists" } )
    expect(user2.valid?).to eq false
  end
end
