require 'rails_helper'

feature 'a logged in user should be able to dig a post' do

  context 'when no user is logged in' do

    it 'should not display a link to dig this post' do
      sign_up('bob')
      new_post('This is a post')
      click_link('Sign out')
      expect(page).not_to have_link('dig this Snapshot!')
    end

  end

  context 'when a user is logged in' do

    it 'should display a link to dig this post' do
      sign_up('bob')
      new_post('This is a post')
      expect(page).to have_link('Dig this Snapshot!')
    end

  end

end
