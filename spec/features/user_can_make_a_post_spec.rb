require 'rails_helper'

RSpec.feature "UserCanMakeAPosts", type: :feature do
  scenario 'user makes a post' do
    
    # main page
    visit '/'
    click_button 'Make post'

    # make post route
    attach_file('post-image', './spec/fixtures/test-image.jpeg')
    fill_in 'post_content', with: 'Extra Extra Extra Extra' 
    fill_in 'post_author', with: 'Person'
    click_button 'Make post'

    # main page
    posts = page.all('.post')
    first_post_image = page.find('#post_image-0')['src']

    # expect to be on main page
    expect(current_path).to eq '/'
    
    # expect page to have 1 post
    expect(posts.length).to eq 1

    # expect post to have author
    expect(posts[0].text).to have_text 'Person'
    
    # expect post to have image
    expect(first_post_image).to match /.*\/test-image.jpeg/
    
    # expect post to have Description
    expect(posts[0].text).to have_text 'Extra Extra Extra Extra'

  end

  scenario 'user inputs a file that is not jpeg or png' do
    visit '/'
    click_button 'Make post'

    click_button 'Make post'

    expect(current_path).to eq '/posts' 
    expect(page).to have_content 'Image is required'
    expect(page).to have_content 'Content is required'
    expect(page).to have_content 'Author is required'
  end
end
