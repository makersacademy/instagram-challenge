module ApplicationHelper

	def sign_up email: 'test@test.com', password: 'testtest', confirm: 'testtest'
	  visit '/'
	  click_link 'Sign up'
	  fill_in :Email, with: email
	  fill_in :Password, with: password
	  fill_in :'Password confirmation', with: confirm
	  click_button 'Sign up'
	end

	def add_picture
	 	visit 'pictures'
		click_link('Add a Picture')
		fill_in 'Caption', with: 'Test Caption'
		click_button 'Add Picture'
	end

end