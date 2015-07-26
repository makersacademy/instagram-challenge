require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { is_expected.to have_many :comments }
  
  before do
    @user = User.create username: 'fakeuser', email: 'fake@gmail.com', password: '12345678', password_confirmation: '12345678'
    @user.photos.create(name: 'testcat', image_file_name: "catgrumps.jpg")
  end
    

  it 'can only be deleted by the user who created it' do
    photo = Photo.find_by(name: 'testcat')
    current_user = User.find_by(email: 'fake@gmail.com')
    photo.destroy_as current_user
    expect(Photo.find_by(name: 'testcat')).to be nil
  end

  it 'cannot be deleted by a user other then the one who created it' do 
    photo = Photo.find_by(name: 'testcat')
    user2 = User.create username: 'fakeuser', email: 'fake@gmail.com', password: '12345678', password_confirmation: '12345678'
    expect(photo.destroy_as user2).to be false
  end
end
