require 'rails_helper'

RSpec.feature "Images page", type: :feature do

  scenario "Users can sign up" do
    visit "/users/sign_up"
    fill_in "user_email", with: "flo@test.com"
    fill_in "user_password", with: "testpassword1234"
    fill_in "user_password_confirmation", with: "testpassword1234"
    click_button "Sign up"
    visit "/posts" #change this line?
    expect(page).to have_content("Here are your lovely Posts!")
  end


  scenario "User can sign in, submit image and be taken back to the views " do
    visit "/users/sign_up"
    fill_in "user_email", with: "flo@test.com"
    fill_in "user_password", with: "testpassword1234"
    fill_in "user_password_confirmation", with: "testpassword1234"
    click_button "Sign up"
    find('a[href="/posts/new"]').click
    attach_file('post_image', File.absolute_path('/Users/florencehapgood/Desktop/Projects/instagram-challenge/spec/D50_8772.jpg'))
    #fill_in "post_image", with: "D50_8772.jpg"
    click_button "Submit"
    expect(page).to have_content("Here are your lovely Posts!")
    save_and_open_page
  end


end



#http://localhost:3000/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c01dcb8f435a55928edc422bab772ca48a21ec06/D50_8772.jpg
#http://www.example.com/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--c01dcb8f435a55928edc422bab772ca48a21ec06/D50_8772.jpg
