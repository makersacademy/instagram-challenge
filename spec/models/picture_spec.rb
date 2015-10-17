require 'rails_helper'

describe Picture do

  it { is_expected.to have_many :comments }
  it { is_expected.to belong_to :user }

  it 'is not valid when a picture is not attached' do
    picture = Picture.create(description: 'Nice')
    expect(picture).not_to be_valid
  end
end
