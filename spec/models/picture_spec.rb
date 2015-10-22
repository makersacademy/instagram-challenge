require 'spec_helper'

describe Picture, type: :model do
  
  it { is_expected.to belong_to :user }

  it 'is not valid unless it has a valid user id' do
    picture = Picture.new(name: 'test', caption: 'testing')
    expect(picture).to have(1).error_on(:user_id)
    expect(picture).not_to be_valid
  end

  it 'is not valid unless it has a valid image file name' do
    picture = Picture.new(name: 'test', caption: 'testing')
    expect(picture).to have(1).error_on(:image_file_name)
    expect(picture).not_to be_valid
  end

end
