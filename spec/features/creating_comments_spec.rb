require 'rails_helper'

feature 'Creating Comments' do
  scenario 'can comment on an existing post' do
    user = create :user
    post = create(:post, user_id: user.id)

    visit '/'
    click_link 'Sign In'
    sign_in(user)
    fill_in 'Add a comment...', with: 'Wow, so nice!'
    click_button 'Create Comment'
    expect(page).to have_content 'Wow, so nice!'
  end
end
