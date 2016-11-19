def post_photo
  visit '/posts/new'
  fill_in 'Caption', with: 'Fluffy kittens!'
  click_button 'Post'
end