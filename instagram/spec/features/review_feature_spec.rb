require 'rails_helper'

feature 'reviewing' do
  before do
  Photo.create comment: 'cool'
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end


  scenario 'allows users to leave a review using a form' do
     visit '/photos'
     click_link 'Review cool'
     fill_in "Thoughts", with: "so so"
     click_button 'Leave Review'

     expect(page).to have_content('so so')
  end

end
