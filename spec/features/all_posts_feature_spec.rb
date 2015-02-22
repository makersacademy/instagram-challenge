require 'rails_helper'

feature 'dislay all posts' do

  context 'irregardless of user log in state' do

    it 'should display posts by all users most recent first' do
      sign_up('test')
      new_post('My first Snapshot!')
      click_link 'Sign out'
      expect(page).to have_content '1. My first Snapshot!, posted by test@example.com'
    end

  end


end
