require 'rails_helper'

RSpec.describe User do
  it { is_expected.to be }

  it 'Should reject user that is missing username' do
    user = User.create( { email: 'test@testmail.com' } )
    expect(user.valid?).to eq false;
  end

  it 'Should reject user that is missing email' do
    user = User.create( { username: 'Andy' } )
    expect(user.valid?).to eq false;
  end

  it 'Should reject user with email longer than 250 characters' do
    user = User.create( { username: 'Andy', email: ("a" * 242) + '@testemail.com' } )
    expect(user.valid?).to eq false;
  end

  it 'Should reject user with username longer than 50 characters' do
    user = User.create( { username: 'a' * 51, email: 'test@testmail.com' } )
    expect(user.valid?).to eq false;
  end

  it 'Should reject user with non valid email format' do
    user = User.create( { username: 'Andy', email: 'testtestmail.com' } )
    expect(user.valid?).to eq false;
  end

  it 'Should reject new user if email is not unique in users table' do
    user = User.create( { username: 'Andy', email: 'test@testmail.com' } )
    expect(user.valid?).to eq true;
    user2 = User.create( { username: 'Andy 2', email: 'test@testmail.com' } )
    expect(user2.valid?).to eq false;
  end

  it 'Should accept valid username and email' do
    user = User.create( { username: 'Andy', email: 'test@testmail.com' } )
    expect(user.valid?).to eq true;
  end

  it 'Should downcase email addresses before storing in users table' do
    user = User.create( { username: 'Andy', email: 'TEST@testmail.com' } )
    user_from_table = User.find_by(username: 'Andy')
    expect(user.email).to eq user_from_table.email
  end

end
