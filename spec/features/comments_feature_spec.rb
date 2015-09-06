require 'rails_helper'

feature 'comment on a photo' do

  context 'allows comments on photos' do

    before do
      user = create(:user) do |user|
        user.photos.create(attributes_for(:photo))
      end
      sign_in_as(user)
    end

    it 'lets comments be added' do
      visit photos_path
      click_link 'Comment test'
      fill_in 'Comment', with: 'test comment'
      click_button 'submit comment'
      expect(current_path).to eq photos_path
      expect(page).to have_content 'test comment'
    end
  end
end