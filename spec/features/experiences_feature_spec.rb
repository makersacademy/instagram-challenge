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
      expect(page).to have_content 'axeman'
      expect(page).not_to have_content 'No experiences yet'
      expect(current_path).to eq '/'
    end

    scenario "guest cannot see the 'post an experience' button" do
      expect(page).not_to have_link "Share an experience"
    end
  end
end
