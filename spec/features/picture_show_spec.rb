require 'rails_helper'

feature 'View individual picture' do
  scenario 'shows picture and creator' do
    sign_up
    create_picture
    find("img[src*='https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg']").click
    expect(page).to have_current_path '/pictures/1'
    expect(page).to have_css "img[src*='https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg']"
    expect(page).to have_content "Posted by lint@lint.com"
  end
end
