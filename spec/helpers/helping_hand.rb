module Helpers
  module HelpingHand
    def register
      visit '/'
      click_link 'Sign Up'
      fill_in 'Username', :with => 'peterpan'
      fill_in 'Email', :with => 'pans@email.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'
      click_button 'Sign Up'
    end 

    def register_another_user
      visit '/'
      click_link 'Sign Up'
      fill_in 'Username', :with => 'paneer'
      fill_in 'Email', :with => 'paneer@email.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'
      click_button 'Sign Up'
    end 

    def make_post
      click_link 'New post'
      fill_in 'Image', with: 'https://tinyurl.com/2mshpeur'
      fill_in 'Description', with: 'Wok n Roll'
      click_button 'Post'
    end 
  end 
end 