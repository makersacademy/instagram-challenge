require 'spec_helper'

describe Photo, type: :model do

  it 'is not valid without an image' do
    photo = Photo.new(description: "This is a description")
    expect(photo).to have(1).error_on(:image)
    expect(photo).not_to be_valid
  end

end
