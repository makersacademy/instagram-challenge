require 'rails_helper'

feature 'Comments' do
  let!(:test_comment_message) { 'Hey! You can comment now!' }
  let!(:user) { create :user }

  before do
    log_in
    create_post
  end

  scenario 'Users can comment on their posts' do
    fill_in 'comment_message', with: test_comment_message
    click_button 'Comment'
    expect(page).to have_content(test_comment_message)
  end


end
