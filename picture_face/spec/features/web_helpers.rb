def make_post(title: 'My First Pic',
              image: "spec/files/images/poo.jpg",
              caption: 'a random picture')
  visit '/posts'
  click_link 'Make a Post'
  fill_in 'Title', with: title
  attach_file("Image", "#{image}")
  fill_in 'Caption', with: caption
  click_button 'Create Post'
end

def make_post_without_image(title: 'My First Pic',
              caption: 'a random picture')
  visit '/posts'
  click_link 'Make a Post'
  fill_in 'Title', with: title
  fill_in 'Caption', with: caption
  click_button 'Create Post'
end