require 'rails_helper'

feature 'comments' do

  before do
    visit('/')
    click_link('Sign up')
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button('Sign up')
  end

  before { Image.create description: 'First picture', avatar_file_name: 'test.jpg' }
  # 
  # context 'There are no comments on an image' do
  #   scenario 'An image has no comments' do
  #     visit '/images'
  #     click_link 'View image info'
  #     expect(page).to have_content 'No comments yet'
  #   end
  # end
  #
  # context 'There is a comment on an image' do
  #
  #   before { Comment.create comment: 'Pretty!' }
  #
  #   scenario 'An image has a comment' do
  #     visit '/images'
  #     click_link 'View image info'
  #     expect(page).to have_content 'Pretty!'
  #   end
  # end
end
