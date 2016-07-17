require 'rails_helper'

feature 'Editing posts' do
  before do
    sign_in
    add_post
    find(:xpath, "(//a[contains(@href,'posts/4')])[1]").click
    click_link 'Edit Post'
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'
    expect(page).to have_content("Post updated")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end

  scenario 'cannot edit a post, if adding a file that is not an image file' do
    attach_file 'Image', 'app/assets/images/.keep'
    click_button 'Update Post'
    expect(page).to have_content 'Please use an image file'
  end
end
