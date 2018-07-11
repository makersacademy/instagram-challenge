require 'rails_helper'

RSpec.feature "User can upload an image with their post", type: :feature do
  scenario 'successfuly' do
    sign_up_successfully
    post_comment_and_picture("My cute little kitten!!!", "./app/assets/images/pic_for_test.30.03.png")

    expect(page).to have_content("My cute little kitten!!!")
    expect(page.find('.post_image')['src']).to have_content 'pic_for_test.30.03.png'
  end
end
