require 'rails_helper'

feature 'comments' do
  
  scenario 'allow users to leave a comment using a form' do
    create_post
    leave_comment
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'Super cute!'
  end

  scenario 'when a restaurant is deleted, their comments should too' do
    create_post
    leave_comment
    visit '/posts'
    click_link 'Picture'
    click_link 'Delete'
    expect(page).not_to have_content 'Super cute!'
    expect(page).to have_content 'Post deleted successfully'
  end
end