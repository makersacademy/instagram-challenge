require 'rails_helper'

describe Picture, type: :model do
  it { is_expected.to have_many :comments }
  it 'validates presence of picture' do
    picture = Picture.new(description: 'something')
    expect(picture).to have(1).error_on(:image)
    expect(picture).not_to be_valid
  end
end
