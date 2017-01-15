require 'rails_helper'

RSpec.feature 'Puns', :type => :feature  do
  include WebHelpers
  user1 = {email: 'test@email.com', password: 'notpassword'}

  feature 'puns' do
    context 'no puns have been added' do
      scenario 'should display a prompt to add a pun' do
        visit '/puns'
        expect(page).to have_content 'No puns yet'
        expect(page).to have_link 'Add a pun'
      end
    end

    context 'puns have been added' do
      scenario 'display puns' do
        sign_up(user1)
        create_pun
        expect(page).to have_content('Pun1')
        expect(page).not_to have_content('No puns yet')
      end
    end

    context 'creating puns' do
      scenario 'user can\'t add a pun without signing up' do
        visit '/puns'
        click_link 'Add a pun'
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end

      scenario 'prompts user to fill out a form, then displays the new pun' do
        sign_up(user1)
        click_link 'Add a pun'
        fill_in 'Name', with: 'Pun1'
        click_button 'Create Pun'
        expect(page).to have_content 'Pun1'
        expect(current_path).to eq '/puns'
      end
    end

    context 'viewing puns' do

      before do
        sign_up(user1)
        create_pun
      end

      scenario 'lets user view a pun' do
        visit '/puns'
        click_link 'Pun1'
        expect(page).to have_content 'Pun1'
        expect(page).to have_content 'Funny'
      end
    end

    context 'editing puns' do
      scenario 'let a user edit a pun' do
        sign_up(user1)
        create_pun
        click_link 'Edit Pun1'
        fill_in 'Name', with: 'Pun for the weak'
        fill_in 'Description', with: 'Very funny'
        click_button 'Update Pun'
        click_link 'Pun for the weak'
        expect(page).to have_content 'Pun for the weak'
        expect(page).to have_content 'Very funny'
      end
    end

    context 'deleting puns' do
      scenario 'removes pun when a user clicks delete pun link' do
        sign_up(user1)
        create_pun
        click_link 'Delete Pun1'
        expect(page).not_to have_content 'Delete Pun1'
        expect(page).to have_content 'Pun deleted successfully'
      end
    end

    context 'an invalid pun' do
      scenario 'does not let you submit a name that is too short' do
        sign_up(user1)
        click_link 'Add a pun'
        fill_in 'Name', with: 'yo'
        click_button 'Create Pun'
        expect(page).not_to have_css 'h2', text: 'yo'
        expect(page).to have_content 'error'
      end
    end
  end
end
