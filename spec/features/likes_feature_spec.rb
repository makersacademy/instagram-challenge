require 'rails_helper'

feature 'likes' do
  context 'photo has been added' do
    before do
      sign_up
      upload_photo
      visit '/photos'
    end

    scenario 'should display prompt to like photo' do
      expect(page).to have_link('Like photo')
    end

    scenario 'should display number of likes' do
      click_link 'Like photo'
      expect(page).to have_content('1 like')
    end
  end
end

