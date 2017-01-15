require 'rails_helper'

describe Photo, type: :model do
  it 'is not valid with a title of less than three characters' do
    photo = Photo.new(title: "Te")
    expect(photo).to have(1).error_on(:title)
    expect(photo).not_to be_valid
  end
end
