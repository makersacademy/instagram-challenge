require 'rails_helper'
require 'spec_helper'

describe Photo, type: :model do

  it { should belong_to :user }

  it { is_expected.to have_many :comments }

  it { is_expected.to have_many :likes }

  it 'is not valid without a description' do
    photo = Photo.new(descr: '')
    expect(photo).to have(1).error_on(:descr)
    expect(photo).not_to be_valid
  end

end