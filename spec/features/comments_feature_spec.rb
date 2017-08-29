require 'rails_helper'

feature 'comments'do
  before do
    @user = create(:user)
    @picture = create(:picture)
  end
  context 'pictures have been added' do
    scenario 'need to sign in to comment on pictures' do
      visit '/'
      find(:xpath, "//a[contains(@href,'pictures/#{@picture.id}')][1]").click
      expect(page).to have_content('You need to sign in to comment on pictures')
      expect(page).not_to have_content('Comment')
    end
    scenario 'user can comment on their own picture' do
      sign_in
      find(:xpath, "//a[contains(@href,'pictures/#{@picture.id}')][1]").click
      click_link 'Comment'
      fill_in 'Comment text', with: 'This is my picture'
      click_button 'Comment'
      expect(page).to have_content('This is my picture')
    end
    scenario 'user can comment on others pictures' do
      sign_up_sign_in
      find(:xpath, "//a[contains(@href,'pictures/#{@picture.id}')][1]").click
      expect(page).not_to have_content('Edit Caption')
      expect(page).not_to have_content('Delete Picture')
      click_link 'Comment'
      fill_in 'Comment text', with: 'Wow cool pic!!'
      click_button 'Comment'
      expect(page).to have_content('Wow cool pic!!')
    end
    scenario 'shows all the comments' do
      sign_in
      find(:xpath, "//a[contains(@href,'pictures/#{@picture.id}')][1]").click
      click_link 'Comment'
      fill_in 'Comment text', with: 'This is my picture'
      click_button 'Comment'
      click_link 'Sign out'
      sign_up_sign_in
      find(:xpath, "//a[contains(@href,'pictures/#{@picture.id}')][1]").click
      expect(page).not_to have_content('Edit Caption')
      expect(page).not_to have_content('Delete Picture')
      click_link 'Comment'
      fill_in 'Comment text', with: 'Wow cool pic!!'
      click_button 'Comment'
      expect(page).to have_content('This is my picture')
      expect(page).to have_content('Wow cool pic!!')
    end    
  end
end
