require 'rails_helper'

feature 'post an image' do
  scenario 'add an image and see it in the index' do
    sign_up
    create_picture
    click_link "Back"
    expect(page).to have_css("img[src*='https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg']")
    expect(page).to have_content "Posted by lint@lint.com"
  end
end
