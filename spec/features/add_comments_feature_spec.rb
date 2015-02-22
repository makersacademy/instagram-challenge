require 'rails_helper'

feature 'adding comments to a post' do

  before do
    sign_up('test')
  end

  context 'all posts' do

    it 'should display a comment on this Snapshot link against each post' do
      new_post('My first Snapshot!')
      expect(page).to have_link('Comment on this Snapshot!')
      click_link('Sign out')
      expect(page).to have_link('Comment on this Snapshot!')
    end

  end

  context 'when not logged in' do

    it 'should take you to the log in page' do

    end

    it 'once logged in you should be auto redirected to add comment page' do

    end

  end

  context 'when logged in' do

    it 'should take you to the add comment page' do

    end

  end


end
