def add_post
  visit '/posts'
  click_link 'Add a post'
  fill_in 'Caption', with: 'Beautiful day'
  page.attach_file('post[image]', Rails.root + 'spec/fixtures/snow_and_sun.jpg')
  click_button 'Post'
end
