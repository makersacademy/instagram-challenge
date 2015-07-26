require 'rails_helper'

feature 'liking photos' do
  before do
    @user = User.create username: 'fakeuser', email: 'fake@gmail.com', password: '12345678', password_confirmation: '12345678'
    photo = @user.photos.create(name: 'testcat', image_file_name: "catgrumps.jpg")
    expect(photo).to eq Photo.find_by(name: 'testcat')
  end

  scenario 'a user can like a photo, which updates the photo like count' do
    visit '/'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end