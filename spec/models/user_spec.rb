require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }

  it 'Can create a new user' do
    user = User.create(name: 'Jade', email: 'jade@jade.com', password: '123456')
    expect(user).to be_valid
  end
end
