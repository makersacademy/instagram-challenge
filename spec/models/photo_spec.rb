require 'rails_helper'

RSpec.describe Photo, type: :model do
	it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }

  it 'must have a description' do
  	photo = Photo.new(description: " ")
    expect(photo).to have(1).error_on(:description)
    expect(photo).not_to be_valid
  end

  it 'must attach an image' do
  	photo = Photo.new(image_file_name: nil)
    expect(photo).not_to be_valid
  end

end
