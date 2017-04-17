require 'rails_helper'

feature 'liking post' do
	before do 
    visit '/posts'
    click_link 'Add a post'
    fill_in 'Title', with: 'Sunset'
    attach_file 'Image', 'spec/images/test_pic.jpeg'
    click_button 'Create Post'
  end
  
	scenario 'a user can like a post and the post likes count is updated' do
		visit '/posts'
		click_button('Like')
		expect(page).to have_content '1 like'
	end 
end