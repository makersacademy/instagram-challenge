require 'rails_helper'

feature 'users' do
  context 'user not logged in' do
    scenario 'should allow a user to log in using the top nav' do
      visit '/'
      expect(page).to have_content 'All Pictures'
      expect(page).to have_link 'Post'
    end
  end
end
