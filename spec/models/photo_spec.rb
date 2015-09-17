require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments}
  it 'is not valid without a photo attachment' do
    photo = Photo.new
    expect(photo).not_to be_valid
  end
end
