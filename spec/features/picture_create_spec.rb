require 'rails_helper'

feature 'post an image' do
  scenario 'add an image and see it in the index' do
    sign_up
    create_picture
    expect(page).to have_css("img[src*='https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg']")
  end
end
