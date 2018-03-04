require 'rails_helper'

RSpec.describe Pict, type: :model do

  it 'is valid with picture and title' do
    user = build_stubbed(:user)
    picture =  fixture_file_upload 'spec/docs/images/code_clue.jpg'
    pict = Pict.new(title: 'hello?', image: picture, user: user)
    expect(pict).to be_valid
  end

  it 'is not valid without a title' do
    picture = fixture_file_upload 'spec/docs/images/code_clue.jpg'
    pict = Pict.new(title: nil, image: picture)
    expect(pict).to_not be_valid
  end

  it 'is not valid if title does not have a question mark' do
    picture = fixture_file_upload 'spec/docs/images/code_clue.jpg'
    pict = Pict.new(title: 'helloo', image: picture)
    expect(pict).to_not be_valid
  end

end
