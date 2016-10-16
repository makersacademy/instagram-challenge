
def add_photo
  visit '/photos'
  click_link 'Add photo'
  attach_file('Image', '/Users/Jon/projects/senior/weekend_projects/instagram-challenge/app/assets/images/jonathan_shad.jpg')
  fill_in 'Description', with: 'My makers pic'
  click_button 'Add photo'
end
