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
    user = User.create( { username: 'Andy', email: "a" * 256 } )
    expect(user.valid?).to eq false;
  end

  it 'Should reject user with username longer than 50 characters' do
    user = User.create( { username: 'a' * 51, email: 'test@testmail.com' } )
    expect(user.valid?).to eq false;
  end

  it 'Should accept valid username and email' do
    user = User.create( { username: 'Andy', email: 'test@testmail.com' } )
    expect(user.valid?).to eq true;
  end

end
