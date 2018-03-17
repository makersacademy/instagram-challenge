def create_picture
  visit '/pictures/new'
  fill_in :"picture[pic]", with: "https://cdn.pixabay.com/photo/2017/08/12/19/01/walk-2635038_960_720.jpg"
  fill_in :"picture[description]", with: "A sunny path"
  click_on "Create Picture"
end

def create_invalid_picture
  visit '/pictures/new'
  fill_in :"picture[pic]", with: "https://cdn.pixabay.com/photo/2017/08/12/19/01/walk-2635038_960_720.jpg"
  fill_in :"picture[description]", with: ""
  click_on "Create Picture"
end