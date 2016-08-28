require 'rails_helper'

feature 'Editing posts' do
  scenario 'can access the edit page' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    login_as(user, scope: :user)
    visit post_path(post)
    click_link "Edit Post"
    expect(current_path).to eq edit_post_path(post)
  end

  scenario 'can edit a post' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    login_as(user, scope: :user)
    visit edit_post_path(post)
    fill_in 'Caption', with: 'oops. I needed to edit this'
    click_button 'Update Post'

    expect(page).to have_content('Post updated')
    expect(page).to have_content('oops. I needed to edit this')
  end

  scenario "cannot edit a post without an image" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    login_as(user, scope: :user)
    visit edit_post_path(post)
    attach_file('Image', 'spec/files/images/coffee.zip')
    click_button 'Update Post'
    expect(page).to have_content("Update failed.  Please check the form.")
  end
end
