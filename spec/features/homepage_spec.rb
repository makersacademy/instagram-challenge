require 'rails_helper'

RSpec.feature 'homepage' do
  scenario 'things you see on it' do
    visit('/')
    expect(page).to have_content('Welcome, Stranger!')
    expect(page).to have_content('Please sign in or register to witness magic!')
  end
end
# feature 'Creating posts' do
#    scenario 'user can post an image' do
#      sign_up
#      visit '/upload'
#      attach_file('image[image]', 'spec/files/images/coffee.jpg')
#      fill_in 'image[description]', with: '#coffeeislife'
#      click_on 'Post'
#      expect(page).to have_content('#coffeeislife')
#      expect(page).to have_css("img[src*='coffee.jpg']")
#    end
#  end
