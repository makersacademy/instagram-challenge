def add_image(caption)
  visit "/"
  click_link "Add an image"
  fill_in "Caption", with: caption
end
