def post_a_picture
  visit '/pictures'
  click_link 'Post a picture'
  fill_in 'Title', with: 'My cat is awesome'
  page.attach_file 'picture[image]', './spec/support/cat.jpg'
  click_button 'Post picture'
end
