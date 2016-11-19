require 'rails_helper'

feature 'Photos' do

  context 'no photos have been added' do

    it 'should display a prompt to add a photo' do
      visit '/photos'
      click_link 'Sign up'
      fill_in 'Email', with: "test@hotmail.com"
      fill_in 'Password', with: "123456"
      fill_in 'Password confirmation', with: "123456"
      click_button 'Sign up'
      expect(page).to(have_content("No photos yet"))
      expect(page).to(have_link("Add a photo"))
    end

  end

end

  #   context 'photos have been added' do
  #
  #     before do
  #       User.create(email: "test@hotmail.com", password: "123456")
  #       Photo.create(caption: "this is a photo", user_id: User.last.id)
  #     end
  #
  #     it 'should display the added photo' do
  #       visit '/photos'
  #       expect(page).to(have_content("this is a photo"))
  #       expect(page).not_to(have_content("No photos yet"))
  #     end
  #
  #   end
  #
  #   context 'adding photos' do
  #
  #     scenario 'a logged out user cannot add photos' do
  #       visit '/photos'
  #       expect(page).not_to(have_link('Add a photo'))
  #     end
  #
  #     it 'prompts a user to add a caption' do
  #       visit '/photos'
  #       click_link 'Sign up'
  #       fill_in 'Email', with: "test@hotmail.com"
  #       fill_in 'Password', with: "123456"
  #       fill_in 'Password confirmation', with: "123456"
  #       click_button 'Sign up'
  #       click_link 'Add a photo'
  #       fill_in 'Caption', with: 'This is my first photo'
  #       click_button 'Create Photo'
  #       expect(page).to(have_content("This is my first photo"))
  #       expect(current_path).to(eq('/photos'))
  #      end
  #
  #   end
  #
  #   context 'viewing photos' do
  #     before do
  #       User.create(email: "test@hotmail.com", password: "123456")
  #     end
  #
  #     let!(:photo) { Photo.create(caption: "this is a photo", user_id: User.last.id) }
  #
  #     scenario 'displays the caption for the individual photo' do
  #       visit '/photos'
  #       click_link 'this is a photo'
  #       expect(page).to(have_content('this is a photo'))
  #       expect(current_path).to(eq("/photos/#{photo.id}"))
  #     end
  #
  #   end
  #
  #   context 'editing photos' do
  #     before do
  #       User.create(email: "test@hotmail.com", password: "123456")
  #       Photo.create(caption: "this is a photo", user_id: User.last.id)
  #     end
  #
  #     it 'can only be edited by a logged in user' do
  #       visit '/photos'
  #       expect(page).not_to(have_link('Edit photo'))
  #     end
  #
  #     it "does not let users edit photos they didn't upload" do
  #       visit '/photos'
  #       click_link 'Sign up'
  #       fill_in 'Email', with: "test1@hotmail.com"
  #       fill_in 'Password', with: "123456"
  #       fill_in 'Password confirmation', with: "123456"
  #       click_button 'Sign up'
  #       expect(page).not_to(have_link('Edit photo'))
  #     end
  #
  #     it 'lets the user edit their own photo' do
  #       visit '/photos'
  #       click_link 'Sign in'
  #       fill_in 'Email', with: 'test@hotmail.com'
  #       fill_in 'Password', with: '123456'
  #       click_button 'Log in'
  #       visit '/photos'
  #       click_link 'Edit photo'
  #       fill_in 'Caption', with: "It's still a photo"
  #       click_button 'Update Photo'
  #       expect(page).to(have_content("It's still a photo"))
  #       expect(current_path).to(eq('/photos'))
  #     end
  #   end
  #
  #   context 'deleting photos' do
  #     before do
  #       User.create(email: "test@hotmail.com", password: "123456")
  #       Photo.create(caption: "this is a photo", user_id: User.last.id)
  #     end
  #
  #     it 'can only be deleted by a logged in user' do
  #       visit '/photos'
  #       expect(page).not_to(have_link('Edit photo'))
  #     end
  #
  #     it "does not let users delete photos they didn't upload" do
  #       visit '/photos'
  #       click_link 'Sign up'
  #       fill_in 'Email', with: "batman@hotmail.com"
  #       fill_in 'Password', with: "123456"
  #       fill_in 'Password confirmation', with: "123456"
  #       click_button 'Sign up'
  #       expect(page).not_to(have_link('Delete photo'))
  #     end
  #
  #     it 'lets the user delete their own photo' do
  #       visit '/photos'
  #       click_link 'Sign in'
  #       fill_in 'Email', with: 'test@hotmail.com'
  #       fill_in 'Password', with: '123456'
  #       click_button 'Log in'
  #       visit '/photos'
  #       click_link 'Delete photo'
  #       expect(page).not_to(have_content("this is a photo"))
  #       expect(current_path).to(eq('/photos'))
  #     end
  #   end
  #
  # end
