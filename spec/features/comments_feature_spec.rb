require 'rails_helper'

feature 'commenting' do
  before do
    user = User.create email: 'kirsten@jones.com', password: 'kjkjkjkj', password_confirmation: 'kjkjkjkj'
    user.pictures.create(caption: 'Amazing friggin caption')
  end

  scenario 'allows users to leave a comment on a picture using a form' do
    visit '/pictures'
    click_link 'Comment'
    fill_in 'My_comment', with: 'Amazing friggin comment'
    click_button 'Post comment'

    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'Amaging friggin comment'
  end
end
