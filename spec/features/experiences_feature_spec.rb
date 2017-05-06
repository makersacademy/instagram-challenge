require 'rails_helper'

feature 'experiences' do
  context 'no experiences have been added' do
    scenario 'should display a prompt to add an experience' do
      sign_up
      expect(page).to have_content 'No experiences yet'
      expect(page).to have_link 'Share an experience'
    end
  end

  context 'user not signed in' do
    before do
      sign_up
      add_photo
      click_link "Sign out"
    end

    scenario 'can see shared experiences' do
      expect(page).to have_css 'img'
      expect(page).not_to have_content 'No experiences yet'
    end

    scenario "guest cannot see the 'post an experience' button" do
      expect(page).not_to have_link "Share an experience"
    end

    scenario 'is unable to share an experience' do
      visit new_experience_path
      expect(current_path).to eq new_user_session_path
    end
  end

  context 'signed in user' do
    before do
      sign_up
      add_photo
    end

    scenario 'can share an experience' do
      expect(page).to have_css 'img'
      expect(page).to have_content 'axeman'
      expect(page).to have_link 'Share an experience'
    end

    context 'experience validations' do
      scenario 'user cannot submit an experience without uploading a photo' do
        click_link 'Share an experience'
        fill_in 'Description', with: 'No image'
        click_button 'Post experience'
        expect(page).not_to have_content 'No image'
        expect(page).to have_content 'error'
      end
    end
  end
end
