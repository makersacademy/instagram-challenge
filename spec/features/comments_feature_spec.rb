require 'rails_helper'

feature 'commenting' do

  before do
    sign_up
    upload_picture
    click_link 'Sign out'
  end

  it 'can post a comment' do
    sign_up(email:'test2@example.com', password:'testpassword')
    click_link 'Add a comment'
    fill_in 'Comment', with: 'Test comment'
    click_button 'Leave comment'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'test2 Test comment'
  end

  it 'throws an error if comment is empty' do
    sign_up(email:'test2@example.com', password:'testpassword')
    click_link 'Add a comment'
    click_button 'Leave comment'
    expect(page).to have_content 'You must enter a comment'
  end


end
