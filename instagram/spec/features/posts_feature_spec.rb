require 'rails_helper.rb'



feature 'Creating posts' do

  scenario 'should have a new post link' do
    visit '/'
    sign_in
    expect(page).to have_link 'New Post'
  end

  scenario 'can create post a pic' do
    visit '/'
    sign_in
    click_link 'New Post'
    attach_file('Image', "spec/images/test.jpg")
    fill_in 'Caption', with: 'nice pic #nice'
    click_button 'Create Post'
    expect(page).to have_content('#nice')
  end

  scenario 'cant create a post without an image' do
    visit '/'
    sign_in
    click_link "New Post"
    fill_in 'Caption', with: "#no pic"
    click_button 'Create Post'
    expect(page).to have_content 'You need an image to post'
  end

  scenario 'new post link not available until logged in' do
    visit '/'
    expect(page).not_to have_content "New Post"
  end
end
