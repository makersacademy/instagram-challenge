require 'rails_helper'

describe Picture, type: :model do
  it { is_expected.to have_many :comments }

  it 'is not valid with a post comment of more than 250 characters' do
    picture = Picture.new(postcomment: '111111111122222222223333333333' +
    '4444444444555555555566666666667777777777888888888899999999990000000000' +
    '1111111111222222222233333333334444444444555555555566666666667777777777' +
    '8888888888999999999900000000001111111111222222222233333333334444444444' +
    '55555555556666666666' + 'extra characters!')
    expect(picture).to have(1).error_on(:postcomment)
    expect(picture).not_to be_valid
  end

end
