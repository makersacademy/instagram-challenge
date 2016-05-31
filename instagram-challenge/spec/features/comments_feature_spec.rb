require 'rails_helper'

feature 'comments' do
  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end
  let!(:anime) {Picture.create(description:'New picture')}
  context 'user can add comments to the picture' do
    scenario 'allows user to leave a comment' do
      visit 'pictures'
      click_link 'Comment on New picture'
      fill_in 'Thoughts', with: 'love the picture'
      click_button 'Leave Comment'
      click_link 'View all comments'
      expect(current_path).to eq "/pictures/#{anime.id}"
      expect(page).to have_content 'love the picture'
    end
  end
end
