def post_a_picture
  visit '/pictures'
  click_link 'Post a picture'
  fill_in 'Title', with: 'My cat is awesome'
  page.attach_file 'picture[image]', './spec/support/cat.jpg'
  click_button 'Post picture'
end

def leave_a_comment(words: 'What a fantastic cat' )
  visit '/pictures'
  click_link 'Comment'
  fill_in 'comment[words]', with: words
  click_button 'Post comment'
end
