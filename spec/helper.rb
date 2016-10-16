
def add_photo
  visit '/photos'
  click_link 'Add photo'
  attach_file('Image', '/Users/Jon/projects/senior/weekend_projects/instagram-challenge/public/system/photos/images/000/000/001/medium/jonathan_shad.jpg')
  fill_in 'Description', with: 'My makers pic'
  click_button 'Add photo'
end
