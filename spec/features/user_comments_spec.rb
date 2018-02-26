require 'rails_helper'

feature 'user comments' do
  scenario 'user can leave a comment on a post' do
    sign_up
    create_post
    fill_in 'comment_body', with: 'OMG'
    click_button 'Create Comment'
    expect(page).to have_content('OMG')
  end
end
