require 'rails_helper'

feature 'Picture' do
  # attach_file('Image', 'spec/files/images/coffee.jpg')

  def sign_up(user)
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password_confirmation
    click_button 'Sign up'
  end

  let(:user) { build :user }

  context 'when there are no pictures' do

    scenario 'should have a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end

    scenario 'cannot add a picture if not logged in' do
      visit '/pictures'
      click_link 'Add a picture'
      expect(page).to have_content 'Log in'
      expect(page.current_path).to eq '/users/sign_in'
    end

    scenario 'can add a picture if logged in' do
      sign_up(user)
      click_link 'Add a picture'
      attach_file('picture[image]', File.join(Rails.root,'spec',"files", 'images', 'duck.jpg'))
      fill_in 'Name', with: 'Kiss'
      click_button 'Create Picture'
      expect(page).to have_content 'Kiss'
      expect(page).not_to have_content 'No pictures yet'
    end

  end

  context 'when creating pictures' do

    scenario "picture's name cannot be shorter than 2 characters" do
      sign_up(user)
      visit '/pictures'
      click_link 'Add a picture'
      attach_file('picture[image]', File.join(Rails.root,'spec',"files", 'images', 'duck.jpg'))
      fill_in 'Name', with: 'A'
      click_button 'Create Picture'
      expect(page).to have_content 'error'
    end

    scenario "picture's name cannot be longer than 100 characters" do
      sign_up(user)
      visit '/pictures'
      click_link 'Add a picture'
      attach_file('picture[image]', File.join(Rails.root,'spec',"files", 'images', 'duck.jpg'))
      fill_in 'Name', with: "Maybe this is a wrong test but I want my picture's name not to be longer than one hundred characters."
      click_button 'Create Picture'
      expect(page).to have_content 'error'
    end

  end

  context 'pictures have been created' do

    before do
      sign_up(user)
      click_link 'Add a picture'
      attach_file('picture[image]', File.join(Rails.root,'spec',"files", 'images', 'duck.jpg'))
      fill_in 'Name', with: 'Kiss'
      fill_in 'Description', with: 'You'
      click_button 'Create Picture'
    end

    scenario 'should display the pictures' do
      visit '/'
      expect(page).to have_content 'Name: Kiss'
      expect(page).to have_content 'Description: You'
    end

    scenario 'can go to the pictures individual page' do
      visit '/'
      click_link 'Kiss'
      expect(page).to have_content 'Name: Kiss'
      expect(page).to have_css("img[src*='duck.jpg']")
    end

    scenario 'can edit a picture' do
      click_link 'Kiss'
      click_link 'Edit Picture'
      fill_in 'Name', with: 'You'
      click_button 'Update Picture'
      expect(page).to have_content 'You'
      expect(page).to have_content "You have successfully updated the picture"
    end

    scenario "user cannot edit other people's pictures" do
      click_link 'Sign out'
      user2 = build :user, email: 'test2@example.com'
      sign_up(user2)
      visit '/'
      click_link 'Kiss'

      click_link 'Edit Picture'
      fill_in 'Name', with: 'You'
      click_button 'Update Picture'
      expect(page).to have_content 'Only the creator can edit the picutre'
    end

    scenario 'can delete a picture' do
      click_link 'Kiss'
      click_link 'Delete Picture'
      expect(page.current_path).to eq '/pictures'
      expect(page).to have_content 'You have successfully deleted the picture'
      expect(page).not_to have_content 'Kiss'
    end

    scenario "cannot delete someone else's picture" do
      click_link 'Sign out'
      user2 = build :user, email: 'test2@example.com'
      sign_up(user2)
      visit '/'
      click_link 'Kiss'
      click_link 'Delete Picture'
      expect(page).to have_content 'Only the creator can delete the picture'
    end

  end

end
