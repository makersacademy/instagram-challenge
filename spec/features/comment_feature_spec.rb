require 'rails_helper'

feature 'Comment' do

  before do
    sign_up
    post_a_picture
    click_on 'Sign out'
  end

  context 'when user is logged in' do
    scenario 'user can leave a comment on a post' do
      sign_in
      expect(page).to have_link 'Comment'
    end
  end

  context 'when user is not logged in' do
    scenario 'user cannot leave a comment' do
      expect(page).not_to have_link 'Comment'
    end
  end

end
