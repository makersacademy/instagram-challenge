require 'rails_helper'

describe Picture, type: :model do

  before do
    user = create(:user)
    user.pictures.create(caption: 'monkey', image_file_name: "monkeys.jpg")
  end

  it { is_expected.to belong_to :user }

  it { is_expected.to have_many :comments }

  it { is_expected.to have_many :likes }

  it 'can be deleted by the user who posted it' do
    pic = Picture.find_by(caption: 'monkey')
    current_user = User.find_by(username: 'katsuraku')
    pic.destroy_as current_user
    expect(Picture.find_by(caption: 'monkey')).to be nil
  end

  it 'cannot be deleted by a user other then the one who posted it' do
    pic = Picture.find_by(caption: 'monkey')
    user2 = User.create email: 'katsuraku@gmail.com', password: 'kjkjkjkj', password_confirmation: 'kjkjkjkj', username: 'kjones'
    expect(pic.destroy_as user2).to be false
  end
end
