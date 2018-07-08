require 'rails_helper'

RSpec.feature "User can upload an image with their post", type: :feature do
  scenario 'successfuly' do
    sign_up_successfully

    click_link 'New Post'
    attach_file('post[image]', 'pic_for_test.30.03.png')
    fill_in "Content", with: "My cute little kitten!!!"
    click_button "Create Post"

    expect(page).to have_content("My cute little kitten!!!")
    expect(page.find('.profile_pic')['src']).to have_content 'profile_pic_for_test.30.03.png'
  end
end
