require 'rails_helper'

feature 'commenting on posts' do
  before {Post.create description: 'Alpaca'}

  scenario 'allow users to leave a comment using a form' do
    visit '/posts'
    click_link 'Comment on Alpaca'
    fill_in "Text", with: "What is that?"
    click_button 'Leave Comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content('What is that?')
  end


  scenario 'allow users to delete a comment' do
    visit '/posts'
    click_link 'Comment on Alpaca'
    fill_in "Text", with: "What is that?"
    click_button 'Leave Comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content('What is that?')
    click_link 'Delete Comment'
    expect(page).not_to have_content 'What is that?'
    expect(page).to have_content 'Comment deleted successfully'
  end
end