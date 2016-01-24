

def sign_up
  FactoryGirl.create(:hipster)
end

def sign_in(user)
  click_link "Sign in"
  fill_in "hipstername", with: user.hipstername
  fill_in "password", with: user.password
  click_button "Log in"
end


def add_picture
    visit '/hipstergrams'
    click_link 'Upload new hipstergram'
    attach_file :hipstergram_image, './spec/photos/test.jpg'
    fill_in 'Description', with: 'Just some triple distilled mason water cold brew'
    click_button 'Create Hipstergram'
end
