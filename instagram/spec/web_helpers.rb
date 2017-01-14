def post_photo
  visit '/photos'
  click_link 'Post a photo'
  attach_file('photo[image]', 'spec/pictures/my_lunch.jpg')
  fill_in 'Caption', with: 'My Lunch'
  click_button 'Post'
end
