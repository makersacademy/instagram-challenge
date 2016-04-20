require 'capybara/dsl'
require 'selenium-webdriver'
require 'Rails_helper'

feature 'user can add a photo' do
	context 'when no photo have been added' do
		it'displays no photo' do 
			visit('/')
			expect(page).to have_content('No photos added yet')
			expect(page).to have_link('Add a photo')
		end
	end

	context 'when photo has been added' do
		it'displays the photo' do 
			sign_up_and_in("Russell", "Vaughan", "russellvaughan", "russell@example.com")
			click_link('Add a photo')
			expect(current_path).to eq('/photos/new')
			allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(:true)
			attach_file('photo[image]', "#{Rails.root}/spec/cat.jpg", visible: false)
			click_button('Create Photo')
			expect(page).to have_css("img[src*='cat.jpg']")
		end
	end

	it'displays a brief description' do 
		sign_up_and_in("Russell", "Vaughan", "russellvaughan", "russell@example.com")
		click_link('Add a photo')
		expect(current_path).to eq('/photos/new')
		allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(:true)
		attach_file('photo[image]', "#{Rails.root}/spec/cat.jpg", visible: false)
		fill_in('Description', with: "Check out my cat" )
		click_button('Create Photo')
		expect(page).to have_content("Check out my cat")
	end
end



feature 'a user can edit a photo' do 

	it 'edits a photo' do 
		sign_up_and_in("Russell", "Vaughan", "russellvaughan", "russell@example.com")
		create_photo
		first(:css, 'a[href*="1"]').click
		click_link("Edit Photo")
		fill_in('Description', with: "Check out my cute cat" )
		click_button('Update Photo')
		expect(page).to have_content("Check out my cute cat")
	end


	it 'deletes a photo' do 
		sign_up_and_in("Russell", "Vaughan", "russellvaughan", "russell@example.com")
		create_photo
		first(:css, 'a[href*="1"]').click
		click_link("Delete Photo")
		expect(page).to_not have_css("img[src*='cat.jpg']")
	end
end

feature 'A user cannot add a photo' do 
	it 'if not logged in' do 
		visit('/')
		click_link('Add a photo')
		expect(current_path).not_to eq('/photos/new')
	end
end

feature 'A user only delete their own photo' do 
	it 'cannot delete another users photo' do 
		sign_up_and_in("Russell", "Vaughan", "russellvaughan", "russell@example.com")
		create_photo
		click_link("Sign Out")
		sign_up_and_in("Johnny", "Appleseed", "jappleseeed", "johnny@example.com")
		first(:css, 'a[href*="photo"]').click
		expect(page).to_not have_link("Delete Photo")
	end
end


