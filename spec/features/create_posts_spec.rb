require 'rails_helper.rb'
require_relative 'features_helper.rb'
feature 'Creating posts' do
  scenario 'can create a post' do
    signup
    click_link 'New Post'
    attach_file('post[image]', 'spec/files/images/sunset.jpg')
    fill_in 'post[caption]', with: '#sunset'
    click_button 'Create Post'
    expect(page).to have_content('#sunset')
    expect(page).to have_css("img[src*='sunset.jpg']")
  end 
  scenario 'needs an image to create a post' do  
    signup
    click_link 'New Post'
    fill_in 'Caption', with: "No picture"
    click_button 'Create Post'
    expect(page).to have_content('Your post could not be created')
  end  
end

feature 'Can view individual posts' do  

  scenario 'Can click and view a single post' do
    user = create(:user) 
    post = create(:post, user: user) 
    signin
    find(:xpath, ".//a[@href='/posts/#{post.id}']").click 
    expect(page.current_path).to eq(post_path(post))
  end
end   
