require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can make a post' do
    visit '/'
    click_link('new-post')
    attach_file('Image', "spec/files/images/sunrise.jpg")
    fill_in 'Caption', with: "Amazing sunrise! #sunrise"
    click_button 'Post'
    expect(page).to have_content "Amazing sunrise! #sunrise"
    expect(page).to have_css("img[src*='sunrise.jpg']")
  end

  scenario 'posting without an image' do
    visit '/'
    click_link('new-post')
    fill_in 'Caption', with: "Amazing sunrise! #sunrise"
    click_button 'Post'
    expect(page).to have_content "Please add an image"
  end

  scenario 'posting an invalid file' do
    visit '/'
    click_link('new-post')
    attach_file('Image', "spec/files/sunrise.txt")
    fill_in 'Caption', with: "Amazing sunrise! #sunrise"
    click_button 'Post'
    expect(page).to have_content "Image has an invalid content type"
  end
end
