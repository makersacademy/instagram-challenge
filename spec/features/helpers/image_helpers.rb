module ImageHelpers

 def submit_test_image(image_title: 'Beast and Magneto',
                       image_desc: 'Two cheeky Rabbits',
                       image_file: 'spec/fixture/test_rabbits.jpeg')
   click_link('add_new_image')
   fill_in :Title, with: image_title
   fill_in :Description, with: image_desc
   attach_file('image[image_file]', Rails.root.join(image_file))
   click_button 'Create Image'
 end
end
