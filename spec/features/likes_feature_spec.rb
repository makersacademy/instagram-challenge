require 'rails_helper'

feature 'liking pictures' do
  before do
    user = create(:user)
    user.pictures.create(caption: 'Amazing friggin caption', image: File.open("#{Rails.root}/spec/support/rails.png"))
    login_as user
  end

  scenario 'a user can like a picture, which increments the picture\'s like count', js: true do
    visit '/pictures'
    click_link 'Like'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end
