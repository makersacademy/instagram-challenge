require 'spec_helper.rb'

def create_picture
  picture = {
    link: "https://cdn.pixabay.com/photo/2017/08/12/19/01/walk-2635038_960_720.jpg",
    description: "A sunny path"
  }
end

def create_comment
  comment = 'Linda foto'
end

# Name can be better here I believe
def sign_up_details
  user_details = {
    email: 'lolaflores@lafarona.com',
    password: 'miniñalola'
  }
end

def create_valid_picture
  picture = create_picture

  visit new_picture_path
  fill_in :"picture[link]", with: picture[:link]
  fill_in :"picture[description]", with: picture[:description]
  click_on "Create Picture"
end

def create_invalid_picture
  picture = create_picture

  visit new_picture_path
  fill_in :"picture[link]", with: picture[:link]
  fill_in :"picture[description]", with: ""
  click_on "Create Picture"
end

def create_valid_comment
  comment = create_comment

  click_on 'Add Comment'

  fill_in :"comment[comment]", with: comment
  click_on 'Create Comment'
end

def sign_up
  user_details = sign_up_details

  visit new_user_registration_path
  fill_in :"user[email]", with: user_details[:email]
  fill_in :"user[password]", with: user_details[:password]
  fill_in :"user[password_confirmation]", with: user_details[:password]
  click_on 'Sign up'
end
