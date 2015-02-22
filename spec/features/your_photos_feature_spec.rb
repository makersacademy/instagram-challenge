require 'rails_helper'

feature 'your photos' do

  context 'user not logged in' do

    it 'should display a prompt to login or sign up' do
      visit '/posts'
      expect(page).to have_content('You must log in or sign up to view your snapshots')
    end

  end

  context 'user logged in' do

    context 'user has no posted Snapshots' do

      it 'should tell the user they do not have any snapshots' do
        sign_up('test')
        expect(page).to have_content 'You have not yet posted any Snapshot!s'
      end

    end

  end

end
