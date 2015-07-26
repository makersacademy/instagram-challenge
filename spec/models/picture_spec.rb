require 'spec_helper'

describe Picture, type: :model do
 
  it 'is not valid without a name and attached file' do
    picture = Picture.new
    expect(picture).to have(1).error_on(:name)
    expect(picture).to have(1).error_on(:avatar)
    expect(picture).not_to be_valid
  end
end