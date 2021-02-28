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
  end 
end 