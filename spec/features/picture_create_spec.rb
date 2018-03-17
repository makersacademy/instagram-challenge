require 'rails_helper'

feature 'post an image' do
  scenario 'add an image and see it in the index' do
    visit '/pictures/new'
    fill_in "picture[url]", with: "https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg"
    click_button 'Save Picture'
    expect(page).to have_css("img[src*='https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg']")

  end
end
