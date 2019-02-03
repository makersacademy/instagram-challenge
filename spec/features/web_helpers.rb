def newpost1
  visit '/'
  click_on 'New Post'
  attach_file('Image', "spec/files/images/jackfruit.jpg")
  fill_in 'Caption', with: 'Jack in the Fruit'
  click_on 'Create Post'
end

def newpost2
  visit '/'
  click_on 'New Post'
  attach_file('Image', "spec/files/images/nik.jpg")
  fill_in 'Caption', with: 'Nik not in fruit'
  click_on 'Create Post'
end
