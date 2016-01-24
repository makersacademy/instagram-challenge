require 'rails_helper'

img = Rack::Test::UploadedFile.new('spec/files/pirates1.jpeg', 'image/jpg')

RSpec.describe Picture, type: :model do
  it {should have_many(:comments).dependent(:destroy)}
  it {should belong_to :user}

  it 'is not valid without a title' do
    picture = Picture.new(title: nil)
    expect(picture).to have(1).error_on(:title)
    expect(picture).not_to be_valid
  end

  it 'is not valid without an image' do
    picture = Picture.new(title: 'Pic', image: nil)
    expect(picture).to have(1).error_on(:image)
    expect(picture).not_to be_valid
  end

  it "removes coments when deleted" do
    picture = Picture.create(title: 'Pic', image: img)
    picture.comments.create(message: "good")
    expect{picture.destroy}.to change{picture.comments.count}.by(-1)
  end

end
