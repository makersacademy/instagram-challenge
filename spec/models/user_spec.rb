require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it 'Can create a new user' do
    user = User.create(name: 'Jade', email: 'jade@jade.com')
    expect(user).to be_valid
  end
end
