require 'rails_helper'

feature 'Creating a new user' do  

  scenario 'can create a new user via the index page' do
	sign_up('bingo888@gmail.com', 'bingo888')
  	expect(page).to have_content 'Welcome! You have signed up successfully'
  end
end

