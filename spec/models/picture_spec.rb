require 'spec_helper'

describe Picture, type: :model do
  it { is_expected.to have_many :likes }

  it 'is not valid with no description' do
    picture = Picture.new(image: 'Kitten', description: '')
    expect(picture).to have(1).error_on(:description)
    expect(picture).not_to be_valid
  end

end