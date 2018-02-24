require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/arsenal.jpg")
    fill_in 'Caption', with: 'Gooners!!! #arsenal'
    click_button 'Create Post'
    expect(page).to have_content('#arsenal')
    expect(page).to have_css("img[src*='arsenal.jpg']")
  end

	it 'needs an image to create a post' do
  	visit '/'
  	click_link 'New Post'
  	fill_in 'Caption', with: 'Gooners!!! #arsenal'
  	click_button 'Create Post'
  	expect(page).to have_content("No, no, no! - Image required to post")
	end
end
