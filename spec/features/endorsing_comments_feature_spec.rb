require 'rails_helper'

feature 'endorsing comments' do

   before do
     sign_in
     add_post
   end

   xscenario 'a user can endorse a post, and updates the endorsement count' do
     click_link 'Endorse Post'
     expect(page).to have_content '1 endorsement'
   end
end
