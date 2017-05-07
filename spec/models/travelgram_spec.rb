require 'rails_helper'

describe Travelgram, type: :model do

  before do
    User.create(email: "user@name.com", password: 'password', password_confirmation: 'password')
  end

  it 'is not valid with a name of less than three characters' do
    user = User.first
    adventure = user.travelgrams.new(name: 'Ba')
    expect(adventure).to have(1).error_on(:name)
    expect(adventure).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    user = User.first
    user.travelgrams.create(name: 'Bali trip')
    adventure = user.travelgrams.new(name: 'Bali trip')
    expect(adventure).to have(1).error_on(:name)
  end
end
