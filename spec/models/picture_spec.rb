require 'rails_helper'

describe Picture, type: :model do
  picture = Picture.new

  it 'belongs to user' do
    expect(picture).to belong_to(:user)
  end

  it 'has many comments' do
    expect(picture).to have_many(:comments)
  end

  it 'has many likes' do
    expect(picture).to have_many(:likes)
  end
end
