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
  end
end

