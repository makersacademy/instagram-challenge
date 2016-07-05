require 'rails_helper'

describe Picture, :type => :model do

  it 'is not valid without a picture' do
    picture = Picture.new(description: '#sweetsucculents')
    expect(picture).not_to be_valid
  end

end
