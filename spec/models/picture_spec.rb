require 'rails_helper'

describe Picture, type: :model do
  it {should have_many(:comments).dependent(:destroy)}

  it 'is not valid without a title' do
    picture = Picture.new(title: nil)
    expect(picture).to have(1).error_on(:title)
    expect(picture).not_to be_valid
  end

  it 'is not valid without an image' do
    picture = Picture.new(title: 'Pic', image: nil)
    expect(picture).to have(1).error_on(:image)
    expect(picture).not_to be_valid
  end
  
end
