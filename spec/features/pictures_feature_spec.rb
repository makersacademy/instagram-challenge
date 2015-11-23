require 'rails_helper'

feature 'Pictures' do

  let(:user) { build :user }
  before { register(user) }

  context 'when there are no pictures' do

    scenario 'should have a prompt to add a picture' do
      expect(page).to have_content 'Add a post'
    end

    scenario 'cannot add a picture if not logged in' do
      click_link 'Log out'
      expect(page).to have_content 'Please log in or register to upload a picture.'
    end

    scenario 'can add a picture if logged in' do
      add_picture
      expect(page).to have_content 'Duck Punching'
      expect(page).not_to have_content 'No pictures yet'
    end

  end

  context 'when creating pictures' do

    scenario "picture's name cannot be shorter than 2 characters" do
      visit '/'
      click_link 'New Post'
      attach_file('picture[image]', File.join(Rails.root,'spec',"files", 'images', 'duck.jpg'))
      fill_in 'Name', with: 'A'
      click_button 'Create Picture'
      expect(page).to have_content 'error'
    end

    scenario "picture's name cannot be longer than 100 characters" do
      visit '/pictures'
      click_link 'New Post'
      attach_file('picture[image]', File.join(Rails.root,'spec',"files", 'images', 'duck.jpg'))
      fill_in 'Name', with: "#{"a" * 101}"
      click_button 'Create Picture'
      expect(page).to have_content 'error'
    end

  end

  context 'pictures have been created' do

    before { add_picture }

    scenario 'should display the pictures' do
      visit '/'
      expect(page).to have_content 'Name: Duck Punching'
    end

    scenario 'can go to the pictures individual page' do
      visit '/'
      click_link 'Duck'
      expect(page).to have_content 'Name: Duck Punching'
      expect(page).to have_css("img[src*='duck.jpg']")
    end

    scenario 'can edit a picture' do
      click_link 'Duck'
      click_link 'Edit picture'
      fill_in 'Name', with: 'You'
      click_button 'Update Picture'
      expect(page).to have_content "You have successfully updated the picture"
    end

    scenario "user cannot edit other people's pictures" do
      click_link 'Log out'
      user2 = build :user, email: 'test2@example.com'
      register(user2)
      visit '/'
      click_link 'Duck'

      click_link 'Edit picture'
      fill_in 'Name', with: 'You'
      click_button 'Update Picture'
      expect(page).to have_content 'Only the creator can edit the picutre'
    end

    scenario 'can delete a picture' do
      click_link 'Duck'
      click_link 'Delete picture'
      expect(page.current_path).to eq '/pictures'
      expect(page).to have_content 'You have successfully deleted the picture'
      expect(page).not_to have_content 'Name: Duck Punching'
    end

    scenario "cannot delete someone else's picture" do
      click_link 'Log out'
      user2 = build :user, email: 'test2@example.com'
      register(user2)
      visit '/'
      click_link 'Duck'
      click_link 'Delete picture'
      expect(page).to have_content 'Only the creator can delete the picture'
    end

  end

end
