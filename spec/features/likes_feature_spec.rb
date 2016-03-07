require 'rails_helper'
feature 'Likes' do
# As a user
# So that I can show my appreciation for a picture
# I would like to 'like' a picture
  context 'when signed in' do
    before(:each) do
      user = FactoryGirl.create(:user, :first)
      sign_in(user.email, user.password)
      post_picture
    end

    scenario 'allows users to \'like\' a picture', js: true do
      click_link '♥'
      expect(page).to have_content '1 like'
    end
  end

  context 'when not signed in' do
    scenario 'prevents users from \'liking\' a picture' do
      user = FactoryGirl.create(:user, :first)
      picture = FactoryGirl.create(:picture, user: user)
      visit '/'
      click_link '♥'
      expect(page).not_to have_content '1 like'
    end
  end
end
