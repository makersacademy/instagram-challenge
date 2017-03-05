require 'rails_helper'

feature "Feature: commenting" do

  let(:picture_desc) { "Test" }
  let(:pic_file_jpeg) { File.new('/files/sunset.jpeg') }
  let(:comment_thoughts) {"Nice"}

  context 'creating comments on home page' do
    before do
      sign_up
      test_image = @user.pictures.create(description: picture_desc, image_file: pic_file_jpeg)
    end

    scenario "allows users to leave comments on pictures" do
      visit '/'
      click_link 'Leave comment'
      fill_in :comment_thoughts, with: "Testing"
      click_button 'Comment'
      expect(current_path).to eq '/'
      expect(page).to have_content('Testing')
    end

    scenario 'does not allow users to leave a comment using a form when not signed in' do
      click_link('Sign out')
      visit '/pictures'
      expect(page).not_to have_content('Leave comment')
    end
  end


end
