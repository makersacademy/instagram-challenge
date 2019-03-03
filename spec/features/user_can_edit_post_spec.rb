# frozen_string_literal: true

feature 'User Story 6 - Users can edit posts', type: :feature do

  scenario 'Users can edit posts' do
    log_in
    find('tbody tr:nth-child(2)').click_link('Edit')
    expect(page).to have_content 'Editing Post'
    fill_in "Caption", with: "I am no longer the second"
    attach_file('post_picture', File.join(Rails.root, 'spec/support/test1.jpg'))
    click_button 'Update Post'
    expect(page).to have_content 'Post was successfully updated.'
    expect(page).to have_css("img[src*='test1.jpg']")
  end

  scenario 'Users can only edit their own posts' do
    sign_up
    expect(page).to have_content('Posts')
    expect(page).to have_css("img[src*='test1.jpg']")
    expect(page).to have_css("img[src*='test2.jpg']")
    expect(page).to have_css("img[src*='test3.jpg']")
    find('tbody tr:nth-child(2)').click_link('Edit')
    expect(page).to_not have_content 'Editing Post'
    expect(page).to have_content('You do not have permission to edit this post.')
  end
end
