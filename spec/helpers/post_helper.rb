def create_post
  sign_up
  click_link 'New Post'
  attach_file('Image', "spec/files/images/octopus.jpg")
  fill_in 'Caption', with: "Cephlapods are fascinating creatures. This is a blue ringed octopus - one of the most beautiful but poisonious creatures of the sea #octopus"
  click_button 'Post'
end

def create_second_post
  click_link 'New Post'
  attach_file('Image', "spec/files/images/gp-octopus.jpg")
  fill_in 'Caption', with: "Enteroctopus dofleini, also known as the Giant Pacific octopus or North Pacific giant octopus, is a large marine cephalopod belonging to the genus Enteroctopus #octopus"
  click_button 'Post'
end
