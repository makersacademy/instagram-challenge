require 'rails_helper'

feature 'commenting' do
  before do
    user = User.create email: 'kirsten@jones.com', password: 'kjkjkjkj', password_confirmation: 'kjkjkjkj'
    user.pictures.create(caption: 'Amazing friggin caption')
  end

  scenario 'allows users to leave a comment on a picture using a form' do
    visit '/pictures'
    click_link 'Comment'
    fill_in 'comment_my_comment', with: 'Amazing friggin comment'
    click_button 'Post Comment'

    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'Amazing friggin comment'
  end
end
