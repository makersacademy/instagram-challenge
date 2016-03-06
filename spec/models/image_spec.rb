require 'rails_helper'

describe Image, type: :model do
  it 'is not valid without a name' do
    image = Image.new
    expect(image).to have(1).error_on(:name)
    expect(image).not_to be_valid
  end

  it 'is not valid without an image' do
    image = Image.new
    expect(image).to have(1).error_on(:image)
    expect(image).not_to be_valid
  end
end