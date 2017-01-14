require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'a user can create a post' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Caption', with: 'Burritos are a mans best friend'
    attach_file('Image', 'spec/files/images/burrito.jpg')
    click_button 'Create post'
    expect(page.current_path).to eq '/posts/1'
    expect(page).to have_content('Burritos are a mans best friend')
    expect(page).to have_css("img[src*='burrito.jpg']")
  end
end
