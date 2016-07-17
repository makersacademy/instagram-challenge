require 'rails_helper'

feature 'Editing posts' do
  before do
    create_post
  end

  scenario 'can edit a post' do
    click_link 'Edit Post'
    fill_in 'Caption', with: 'oops. I needed to edit this'
    click_button 'Update Post'
    expect(page).to have_content('Post updated')
    expect(page).to have_content('oops. I needed to edit this')
  end

  scenario "cannot edit a post without an image" do
    click_link 'Edit Post'
    attach_file('Image', 'spec/files/images/coffee.zip')
    click_button 'Update Post'
    expect(page).to have_content("Update failed.  Please check the form.")
  end
end
