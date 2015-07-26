require 'rails_helper'

feature 'photos' do

  context 'no photo have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'adding photo' do

    scenario 'should display a photo and his title' do
      visit '/photos'
      sign_up
      click_link 'Add a photo'
      attach_file 'Image', 'spec/features/sea.jpg'
      fill_in 'Title', with: 'Awesome sea'
      click_button 'Add photo'
      expect(page).to have_content 'Awesome sea'
      expect(page).to have_css('img[src*="sea.jpg"]')
    end

    scenario 'does not let you submit a photo without a title' do
      visit '/photos'
      sign_up
      click_link 'Add a photo'
      attach_file 'Image', 'spec/features/sea.jpg'
      fill_in 'Title', with: ''
      click_button 'Add photo'
      expect(page).to have_content 'error'
    end

    scenario 'does not let you submit a photo without upload a image' do
      visit '/photos'
      sign_up
      click_link 'Add a photo'
      fill_in 'Title', with: 'hello world'
      click_button 'Add photo'
      expect(page).to have_content 'error'
    end


  end

  context 'viewing photos' do

    let!(:sea) {Photo.create(title:'Awesome sea',
                             image: File.new("spec/features/sea.jpg") )}

    scenario 'Lets a user view profile page of a photo' do
      visit '/photos'
      click_link 'Show photo'
      expect(page).to have_content 'Awesome sea'
      expect(current_path).to eq "/photos/#{sea.id}"
    end

  end

  context 'editing title or photo' do

    scenario 'let a user edit the title' do
      sign_up
      click_link 'Add a photo'
      attach_file 'Image', 'spec/features/sea.jpg'
      fill_in 'Title', with: 'Awesome sea'
      click_button 'Add photo'
      click_link 'Edit'
      fill_in 'Title', with: 'Really awesome sea'
      click_button 'Edit'
      expect(page).to have_content 'Really awesome sea'
      expect(current_path).to eq '/photos'
    end

    #  scenario "don't let a user edit the photo if he is not the one that added it" do
    #   sign_up
    #   click_link 'Add a photo'
    #   attach_file 'Image', 'spec/features/sea.jpg'
    #   fill_in 'Title', with: 'Awesome sea'
    #   click_button 'Add photo'
    #   click_link 'Sign out'
    #   sign_up_2
    #   click_button 'Edit'
    #   expect(page).to have_content 'You cannot edit this photo'
    #   expect(current_path).to eq '/photos'
    # end

end

  context 'deleting photo after log in' do

    let!(:sea) {Photo.create(title:'Awesome sea',
                             image: File.new("spec/features/sea.jpg") )}

    scenario 'removes a photo when a user clicks a delete link' do
      visit '/photos'
      click_link 'Delete'
      expect(page).to_not have_content 'Awesome sea'
    end
  end

  context 'deleting photo added by another user' do

    scenario 'fails when I am not the user that added the photo' do
      sign_up
      click_link 'Add a photo'
      attach_file 'Image', 'spec/features/sea.jpg'
      fill_in 'Title', with: 'Awesome sea'
      click_button 'Add photo'
      click_link 'Sign out'
      sign_up_2
      click_link 'Delete'
      expect(page).to have_content "You cannot delete this photo"
    end
  end

  def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def sign_up_2
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'new_user@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

end