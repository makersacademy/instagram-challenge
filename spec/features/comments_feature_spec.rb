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
      fill_in 'Comment', with: 'test comment'
      click_button 'comment'
      expect(current_path).to eq photos_path
      expect(page).to have_content 'test comment'
      expect(page).to have_content 'Comment by: test_user@test.com'
    end
  end

  context 'user not logged in' do

      before do
        user = create(:user) do |user|
          user.photos.create(attributes_for(:photo))
        end
      end

    it 'does not allow user to add comments' do
      visit photos_path
      expect(page).not_to have_button 'submit comment'
    end
  end
end