# frozen_string_literal: true

feature 'User Story 2 - Users can create posts', type: :feature do
  scenario 'Users can create a valid post from the form' do
    log_in
    expect(page).to have_content('Posts')
    click_link('New Post')
    expect(page).to have_content('New Post')
    fill_in 'Caption', with: 'I am a Capybara caption'
    attach_file('post_picture', File.join(Rails.root, 'spec/support/test1.jpg'))
    click_button('Create Post')
    expect(page).to have_content('Post was successfully created')
    expect(page).to have_content('I am a Capybara caption')
    expect(page).to have_css("img[src*='test1.jpg']")
    expect(page).to have_content('bob', count: 1)
  end
end
