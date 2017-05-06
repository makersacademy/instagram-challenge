require 'rails_helper'

feature 'experiences' do
  context 'no experiences have been added' do
    scenario 'should display a prompt to add an experience' do
      visit '/experiences'
      expect(page).to have_content 'No experiences yet'
      expect(page).to have_link 'Share an experience'
    end
  end

  context 'user not signed in' do
    before do
      sign_up
      add_photo
    end
    scenario 'can see shared experiences' do
      expect(page).to have_css 'img'
      expect(page).to have_content 'axeman'
      expect(page).not_to have content 'No experiences yet'
      expect(current_path).to eq '/'
    end
  end
end
