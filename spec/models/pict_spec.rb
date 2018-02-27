require 'rails_helper'

RSpec.describe Pict, type: :model do

  it 'is not valid without a title' do
    pict = Pict.new(title: nil)
    expect(pict).to_not be_valid
  end

  it 'is not valid if title does not have a question mark' do
    pict = Pict.new(title: 'helloo')
    expect(pict).to_not be_valid
  end
end
