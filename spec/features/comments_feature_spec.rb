require 'rails_helper'

feature 'commenting' do
  scenario 'allows users to comment on a picture' do
    sign_up
    create_picture
    click_link '1'
    click_link 'add a comment'
    fill_in 'Thoughts', with: 'Cute!'
    click_button 'done'
    expect(page).to have_content('Cute!')
  end

  scenario 'a comment is displayed with the username of the user who posted it' do
    sign_up
    create_picture
    click_link '1'
    click_link 'add a comment'
    fill_in 'Thoughts', with: 'Cute!'
    click_button 'done'
    expect(page).to have_content ('amanda says: Cute!')
  end

  context 'deleting comments' do
    scenario 'allows users to delete their comment' do
      sign_up
      create_picture
      click_link '1'
      click_link 'add a comment'
      fill_in 'Thoughts', with: 'Cute!'
      click_button 'done'
      click_link 'delete comment'
      expect(page).to have_content('comment deleted')
      expect(page).not_to have_content('Cute!')
    end

    scenario 'users cannot delete comments belonging to other users' do
      sign_up
      create_picture
      click_link '1'
      click_link 'add a comment'
      fill_in 'Thoughts', with: 'Cute!'
      click_button 'done'
      click_link 'sign out'
      sign_up_second_user
      click_link '1'
      expect(page).not_to have_link('delete comment')
    end
  end
end
