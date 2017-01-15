require 'rails_helper.rb'

feature 'Creating posts' do

  let(:user) { create(:user) }

  before do
    login_as(user, :scope => :user)
  end

  scenario 'a logged in user can create a post' do
    visit '/posts'
    click_link 'New post'
    expect(page.current_path).to eq '/posts/new'
    fill_in 'Caption', with: 'Burritos are a mans best friend'
    attach_file('Image', 'spec/files/images/burrito.jpg')
    click_button 'Create post'
    expect(page.current_path).to eq '/posts/1'
    expect(page).to have_content('Burritos are a mans best friend')
    expect(page).to have_css("img[src*='burrito.jpg']")
  end

  scenario 'user must add photos to posts' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Caption', with: 'Burritos are a mans best friend'
    click_button 'Create post'
    expect(page).to have_content "Post not saved. You must have and image and a caption."
  end
end
