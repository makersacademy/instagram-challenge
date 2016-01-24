

def sign_up
  visit "/hipsters/sign_up"
  fill_in "hipstername", with: "Horatiooo"
  fill_in "email", with: "test@live.co.uk"
  fill_in "password", with: "123456789"
  fill_in "password_confirmation", with: "123456789"
  click_button "Sign up"
end

def sign_in
  visit "/"
  click_link "Sign in"
  fill_in "Hipstername", with: user.hipstername
  fill_in "Password", with: user.password
  click_button "Log in"
end


def add_picture
    visit '/hipstergrams'
    click_link 'Upload new hipstergram'
    attach_file :hipstergram_image, './spec/photos/test.jpg'
    fill_in 'Description', with: 'Just some triple distilled mason water cold brew'
    click_button 'Create Hipstergram'
end
