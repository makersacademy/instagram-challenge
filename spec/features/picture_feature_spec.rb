require 'rails_helper'

feature 'pictures' do
  context 'when no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  let(:user){ build :user }
  let(:user2){ build :user2 }

  before do
    sign_up(user)
  end

  context 'when creating pictures' do
    scenario 'prompts user to fill out a form, then displays the new pictures' do
      visit '/'
      click_link 'Add a picture'
      fill_in 'Description', with: 'tower bridge'
      click_button 'Create Picture'
      expect(page).to have_content 'tower bridge'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'when pictures have been added' do

    before do
      add_picture('tower bridge')
    end

    scenario 'display pictures' do
      visit '/'
      expect(page).to have_content('tower bridge')
      expect(page).not_to have_content('No pictures yet')
    end

    scenario 'let a user edit a picture' do
      visit '/'
      click_link 'Edit'
      fill_in 'Description', with: 'london bridge'
      click_button 'Update Picture'
      expect(page).to have_content 'london bridge'
      expect(current_path).to eq '/pictures'
    end

    scenario 'removes a picture when a user clicks a delete link' do
      visit '/'
      click_link 'Delete'
      expect(page).not_to have_content 'tower bridge'
      expect(page).to have_content 'Post deleted successfully'
    end

    scenario 'cannot remove another users picture' do
      visit '/'
      click_link 'Sign out'
      sign_up(user2)
      click_link 'Delete'
      expect(page).to have_content 'tower bridge'
      expect(page).to have_content 'You cannot delete that picture'
    end
  end
end
