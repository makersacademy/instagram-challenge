require 'rails_helper'

RSpec.describe Photo, type: :model do
	it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments }

    it 'must have a description' do
    photo = Photo.new(description: " ")
    expect(photo).to have(1).error_on(:description)
    expect(photo).not_to be_valid
  end
end
