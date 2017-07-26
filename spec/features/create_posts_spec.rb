require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    print page.html
    attach_file('post[image]', 'spec/files/images/sunset.jpg')
    fill_in 'post[caption]', with: '#sunset'
    click_button 'Create Post'
    visit '/'
    expect(page).to have_content('#sunset')
    expect(page).to have_css("img[src*='sunset.jpg']")
  end
end
