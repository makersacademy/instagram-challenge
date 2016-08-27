require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      sign_up
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(caption: 'a nice picture', image: File.new(Rails.root.join('spec','images','img.jpg')))
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('a nice picture')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'posting pictures' do
    scenario 'prompts user to fill out a form, then displays the new picture' do
      sign_up
      post_picture
      expect(page).to have_content 'a nice picture'
      expect(current_path).to eq '/pictures'
    end

    scenario 'user must be logged in to post a picture' do
      visit '/pictures/new'
      expect(page).not_to have_button 'Post picture'
    end
  end

  context 'viewing pictures' do
    let!(:picture) { Picture.create(caption: 'a nice picture', image: File.new(Rails.root.join('spec','images','img.jpg'))) }

    scenario 'lets a user view a picture' do
      visit '/pictures'
      find(:xpath, "//a/img[@alt='a nice picture']/..").click
      expect(page).to have_content 'a nice picture'
      expect(current_path).to eq "/pictures/#{picture.id}"
    end
  end

  context 'editing post' do
    scenario 'let a user edit a picture' do
      sign_up
      post_picture
      visit '/pictures'
      find(:xpath, "//a/img[@alt='a nice picture']/..").click
      click_link 'Edit'
      attach_file 'picture[image]', Rails.root.join('spec','images','img_edit.jpg')
      fill_in 'Caption', with: 'a very nice picture'
      click_button 'Update'
      expect(page).to have_content 'a very nice picture'
      expect(current_path).to eq '/pictures'
    end

    scenario 'users can only edit post which they have created' do
      sign_up
      post_picture
      click_link 'Sign out'
      sign_up_another_user
      first(:xpath, "//a/img[@alt='a nice picture']/..").click
      expect(page).not_to have_link 'Edit'
    end
  end

  context 'deleting pictures' do
    scenario 'removes a picture when a user clicks a delete link' do
      sign_up
      post_picture
      visit '/pictures'
      find(:xpath, "//a/img[@alt='a nice picture']/..").click
      click_link 'Delete'
      expect(page).not_to have_content 'a nice picture'
      expect(page).to have_content 'Picture deleted successfully'
    end

    scenario 'users can only delete post which they have created' do
      sign_up
      post_picture
      click_link 'Sign out'
      sign_up_another_user
      first(:xpath, "//a/img[@alt='a nice picture']/..").click
      expect(page).not_to have_link 'Delete'
    end
  end
end