require 'rails_helper'

feature 'pictures' do

  let(:picture_desc) { "Test" }
  let(:image_file_jpeg) { File.new('spec/features/Mountains.jpg') }
  let(:comment_thoughts) {"Nice"}

  context 'no pictures have been added' do
    scenario 'should diplay a prompt to upload a picture' do
      sign_up
      visit '/pictures'
      expect(page).to have_content 'No pictures posted'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'creating picture posts' do
    scenario 'prompts user to fill out a form, then displays the new picture post' do
      sign_up
      visit "/pictures"
      click_link 'Post a picture'
      fill_in 'Description', with: 'Description'
      click_button 'Post a picture'
      expect(page).to have_content 'Description'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'pictures have been added by a user' do
    before do
      sign_up
      @picture = @user.pictures.create(description: picture_desc, image: image_file_jpeg)
    end

    scenario 'display pictures' do
      visit pictures_path
      expect(page).to have_content("Test")
      expect(page).not_to have_content('No pictures posted')
    end


    scenario 'removes a picture when a user clicks a delete link' do
      visit pictures_path
      click_link 'Delete'
      expect(page).not_to have_content 'Description'
      # expect(page).to have_content 'Restaurant deleted successfully'
    end

  end

end
