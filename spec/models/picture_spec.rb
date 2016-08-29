require 'rails_helper'

describe Picture, type: :model do
  it 'is not a valid file type' do

    picture = Picture.new :description => "Test",
                          :image => File.new(
                          Rails.root + 'spec/images/Test.PDF')

    expect(picture).to have(1).error_on(:image)
    expect(picture).not_to be_valid
  end

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments }
end
