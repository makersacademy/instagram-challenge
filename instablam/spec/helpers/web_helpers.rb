def create_new_picture
  visit '/pictures/new'
  fill_in :"picture[title]", with: "New Picture"
  fill_in :"picture[picture_url]", with: "www.imgur.com"
  click_button "Create Picture"
end
