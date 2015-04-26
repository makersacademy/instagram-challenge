require 'rails_helper'

feature 'commenting on posts' do
  before {Post.create description: 'Alpaca'}

  scenario 'allow users to leave a comment' do
    sign_in_helper
    visit '/posts'
    click_button 'Leave Comment'
    fill_in "Text", with: "What is that?"
    click_button 'Leave Comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content('What is that?')
  end


  scenario 'allow users to delete a comment' do
    sign_in_helper
    visit '/posts'
    fill_in "Text", with: "What is that?"
    click_button 'Leave Comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content('What is that?')
    click_link 'Delete Comment'
    expect(page).not_to have_content 'What is that?'
    expect(page).to have_content 'Comment deleted successfully'
  end

  def sign_in_helper
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end
end