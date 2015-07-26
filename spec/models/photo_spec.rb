require 'spec_helper'

describe Photo, type: :model do
  it { should have_many(:comments).dependent(:destroy) }

  it 'link must be provided' do
    photo = Photo.new(description: 'nice')
    expect(photo).to have(1).error_on(:image_file_name)
    expect(photo).not_to be_valid
  end
end