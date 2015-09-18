require 'rails_helper'

feature 'photos' do

	context "displaying photos" do
	  context 'no photos have been added' do
	    scenario 'should display a prompt to post a photos' do
	      visit '/photos'
	      expect(page).to have_content 'No photos yet'
	      expect(page).to have_button 'Add photo'
	    end
	  end

	  context 'photos have been added' do

	  	let (:user) {User.create(email: "test@test.com", 
	  														password: "password123", 
	  														password_confirmation: "password123"
	  														)}

	    before {Photo.create description: 'Fujisan', user: user}

	    
	    scenario 'Display photos' do
	      visit '/photos'
	      expect(page).to have_content 'Fujisan'
	      expect(page).not_to have_content 'No photos yet'
	    end
	  end
	end

  context "user must be logged in" do

  	before :each do
  		sign_in_user_1
		end

		context 'Adding photos' do    
	    scenario 'Prompts user to add photo, then displays the description' do
	      visit '/photos'
	   	  click_button 'Add photo'
	      fill_in 'Description', with: 'Fujisan'
	      click_button 'Add photo'
	      expect(page).to have_content 'Fujisan'
	      expect(current_path).to eq '/photos'
	    end
	  end

	 #  context 'Deleting photos' do

	 #  # before {Photo.create(description:'Fujisan')}

		#   # scenario 'removes a photo when a user clicks a delete link' do
		#   #   visit '/photos'
		#   #   click_link 'Delete Fujisan'
		#   #   expect(page).not_to have_content 'Fujisan'
		#   #   expect(page).to have_content 'Photo deleted successfully'
		#   # end

	 #    scenario 'can be done by the owner of the picture' do
	 #      add_picture
	 #      click_link 'Delete Kamchatka'
	 #      expect(page).not_to have_content 'Kamchatka'
	 #      expect(page).to have_content 'No photos yet'
	 #    end
		# end
	end

	context "user does not need to be logged in" do
	  context 'viewing photos' do

	  let (:user) {User.create(email: "test@test.com", 
	  												password: "password123", 
	  												password_confirmation: "password123"
	  														)}

	    before {Photo.create description: 'Fujisan', user: user}
	    
	    scenario 'lets a user view a photo' do
	      visit '/photos'
	      expect(page).to have_content 'Fujisan'
	    end
	  end
	end


	private 

	def sign_in_user_1
		visit ("/")
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
	end

	def sign_out
		visit ("/")
    click_link('Sign out')
	end

	def add_picture
	  click_button 'Add photo'
	  #check Capybara attach file syntax - not finding image field.
	  attach_file 'photo[image]', 'spec/test.jpg'
	  fill_in 'Description', with: 'Test Description'
	  click_button 'Add photo'
	end


end