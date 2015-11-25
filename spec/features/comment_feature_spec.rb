require 'rails_helper'

feature 'commenting' do

  before do
    user = build(:user)
    sign_up(user)
    add_image
  end

  scenario 'allows users to leave comments using a form' do
    add_comment
    expect(current_path).to eq '/images'
    expect(page).to have_content('nice pic')
  end

  scenario 'allows users to delete their own comments' do
    add_comment
    click_link 'Missing'
    click_link 'Delete'
    expect(page).to have_content 'Comment deleted successfully'
  end
end
