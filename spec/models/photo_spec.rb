require 'rails_helper'

describe Photo, type: :model do
  it 'is not valid without an image file' do
    photo = Photo.new(caption: 'test', location: 'test')
    expect(photo).to have(1).error_on(:image)
    expect(photo).not_to be_valid
  end
end
