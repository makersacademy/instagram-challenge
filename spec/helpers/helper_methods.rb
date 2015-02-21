def add_picture
  visit '/pictures'
  click_link 'Add a picture'
  attach_file('Image', "#{Rails.root}/spec/support/uploads/derp.png")
  click_button 'Create Picture'
end 


