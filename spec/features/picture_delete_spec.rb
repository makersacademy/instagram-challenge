require 'rails_helper'

feature 'Delete a picture' do
  scenario 'Deletes picture and returns to pictures#index' do
    sign_up
    create_picture
    find("img[src*='https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg']").click
    click_link "De-lint"
    expect(page).to have_current_path '/pictures'
    expect(page).not_to have_css("img[src*='https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg']")
  end
end
