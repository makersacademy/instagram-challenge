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
      new_post('My first Snapshot!')
      click_link('Sign out')
      click_link('Comment on this Snapshot!')
      expect(current_path).to eq('/users/sign_in')
    end

  end

  context 'when logged in' do

    it 'should take you to the add comment page' do
      new_post('My first Snapshot!')
      click_link('Comment on this Snapshot!')
      expect(page).to have_button('Post your comment')      
    end

  end


end
