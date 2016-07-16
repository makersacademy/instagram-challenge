require 'rails_helper'

feature 'posts' do
  context 'no posts have been posted' do
    scenario 'should display a prompt to post a picture' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Create a Post'
    end
  end

  context 'pictures have been added' do
  before do
    Post.create(title: 'Pug', description: 'cute')
  end

  scenario 'display posts' do
    visit '/posts'
    expect(page).to have_content('cute')
    expect(page).not_to have_content('No posts yet')
  end
end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Create a Post'
      fill_in 'Title', with: 'Pug'
      fill_in 'Description', with: 'Cute'
      click_button 'Create Post'
      expect(page).to have_content 'Pug'
      expect(current_path).to eq '/posts'
    end
  end

end
