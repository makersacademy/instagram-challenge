require 'rails_helper'

describe Picture do

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments }

  it 'must have a title' do
    no_title = ''
    picture = Picture.new(title: no_title)
    expect(picture).not_to be_valid
  end

  it 'over 50 characters is invalid' do
    bad_title = 'A' * 51
    picture = Picture.new(title: bad_title)
    expect(picture).not_to be_valid
  end

end