require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "Can submit posts and view them" do
    sign_up_successfully
    post_comment_and_picture("Test text for message!", "./app/assets/images/pic_for_test.30.03.png")

    expect(page).to have_content("Test text for message!")
  end

  scenario "error if text is over 140 characters" do
    comment_over_140_chars = "This message is definitely over 140 characters. This message is
      definitely over 140 characters. This message is definitely over 140 characters.
      This message is definitely over 140 characters. This message is definitely over 140 characters.
      This message is definitely over 140 characters."

    sign_up_successfully
    post_comment_and_picture(comment_over_140_chars, "./app/assets/images/pic_for_test.30.03.png")

    expect(page).to have_content("Content is too long")
  end
end
