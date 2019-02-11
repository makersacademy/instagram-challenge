require 'rails_helper'

feature 'List of posts displayed on homepage' do
  scenario 'Caption + post associated and displayed on homepage' do
    newpost1
    newpost2
    visit '/'
    expect(page).to have_content('Jack in the Fruit')
    expect(page).to have_content('Nik not in fruit')
    expect(page).to have_css("img[src*='jackfruit.jpg']")
    expect(page).to have_css("img[src*='nik.jpg']")
  end
end
