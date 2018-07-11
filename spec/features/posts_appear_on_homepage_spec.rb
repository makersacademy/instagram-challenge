require 'rails_helper'

RSpec.feature "Posts show on homepage", type: :feature do
  scenario "After user successfully makes a post" do
    sign_up_successfully
    post_comment_and_picture("Test text for message!", "./app/assets/images/pic_for_test.30.03.png")

    expect(current_path).to eq root_path
    expect(page).to have_content("Test text for message!")
  end
end
