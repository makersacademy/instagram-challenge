require 'rails_helper'

feature 'commenting' do
  let!(:nomnom){ Picture.create(status:'Broccoli is my favourite!') }

   scenario 'allows hamsters to leave a comment' do
     visit '/pictures'
     visit "/pictures/#{nomnom.id}"
     click_link 'Comment'
     fill_in "Thoughts", with: "YES! Love broccoli!"
     click_button 'Leave Comment'
     expect(current_path).to eq "/pictures/#{nomnom.id}"
     expect(page).to have_content "YES! Love broccoli!"
   end
end
