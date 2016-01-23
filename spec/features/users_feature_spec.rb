require 'rails_helper'

feature '<<Users>>' do
  context 'user not signed in and on homepage' do
    it 'should show a link for sign in and sign up' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end
    it 'should not show a link for sign out' do
      visit '/'
      expect(page).to_not have_link 'Sign out'
    end

  context 'user signed in and on homepage' do
    before do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
      click_button 'Sign up'
    end

    it 'should show a link for sign out' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it 'should not show links for sign in and sign up' do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end

end



end
