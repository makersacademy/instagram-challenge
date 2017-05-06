require 'rails_helper'

describe Travelgram, type: :model do
  it 'is not valid with a name of less than three characters' do
    adventure = Travelgram.new(name: 'Ba')
    expect(adventure).to have(1).error_on(:name)
    expect(adventure).not_to be_valid
  end

  it 'is not valid unless it has a unique name' do
    Travelgram.create(name: 'Bali trip')
    adventure = Travelgram.new(name: 'Bali trip')
    expect(adventure).to have(1).error_on(:name)
  end
end
