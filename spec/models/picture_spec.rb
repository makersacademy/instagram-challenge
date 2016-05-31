require 'spec_helper'

describe Picture, type: :model do
  it 'is not valid without a title' do
    picture = Picture.new(title: '')
    expect(picture).to have(1).error_on(:title)
    expect(picture).not_to be_valid
  end

  it { should have_many(:comments) }
end