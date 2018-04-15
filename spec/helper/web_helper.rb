def add_post
  click_link "New post"
  fill_in "post[photo]", with: 'https://cdn.acidcow.com/pics/20131010/instagram_16.jpg'
  fill_in "post[desc]", with: 'Beautiful sunset'
  click_button "Save Post"
end
