require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { is_expected.to have_many :comments }

  it 'cannot upload without a title' do
    photo = Photo.new(title: '')
    expect(photo).to have(1).error_on(:title)
    expect(photo).not_to be_valid
  end
end
