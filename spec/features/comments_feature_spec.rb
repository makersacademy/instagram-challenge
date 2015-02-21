require 'rails_helper'

feature 'comments' do
  before { Post.create description: 'Awesome latte' }

  scenario 'allows user to leave a comment' do
    visit '/posts'
    click_link 'Write a comment'
    fill_in 'Thoughts', with: 'Great picture'
    click_button 'Comment'
    expect(page).to have_content 'Great picture'
    expect(current_path).to eq '/posts'
  end

  scenario 'an invalid comment' do
    visit '/posts'
    click_link 'Write a comment'
    fill_in 'Thoughts', with: 'XY'
    click_button 'Comment'
    expect(page).not_to have_css 'li', text: 'XY'
    expect(page).to have_content 'error'
  end

end