require 'rails_helper'

feature 'Editing posts' do
  scenario 'Can edit a post' do
    create_post
    visit '/'
    click_link 'Edit Post'
    fill_in 'Caption', with: 'Yum!'
    click_button 'Save Changes'

    expect(page).to have_content('Post Updated')
    expect(page).to have_content('Yum!')
  end

end
