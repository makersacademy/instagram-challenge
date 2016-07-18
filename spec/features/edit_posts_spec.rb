require 'rails_helper'

feature 'Editing posts' do
  scenario 'Can access the edit page' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)

    login_as(user)
    visit post_path(post)
    click_link "Edit Post"

    expect(current_path).to eq edit_post_path(post)
  end

  scenario 'Can edit a post' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)

    login_as(user)
    visit edit_post_path(post)
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end

  scenario 'cannot upload an image that is not an image type' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)

    login_as(user)
    visit edit_post_path(post)
    attach_file 'Image', 'app/assets/images/.keep'
    click_button 'Update Post'

    expect(page).to have_content 'Please use an image file'
  end
end
