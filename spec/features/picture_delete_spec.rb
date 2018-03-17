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

  scenario 'Delete link not visible for images created by other users' do
    sign_up_and_create_image_and_sign_out_user_1
    sign_up_user_2
    click_link "Show me the lint"
    find("img[src*='https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg']").click
    expect(page).not_to have_content "De-lint"
  end
end
