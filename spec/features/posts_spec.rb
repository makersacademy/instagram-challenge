require 'rails_helper'
require 'web_helpers'

feature "Sign up" do

  scenario "can sign up" do
    sign_up
    expect(page).to have_content('test@email.com')
    expect(current_path).to eq('/')
    end
    #
    # it "can add a new post" do
    #     sign_up
    #     click_button 'New'
    #     fill_in :title, with: "Test title"
    #   end


    it "can add a new post" do
      sign_up
      click_button 'New'
      fill_in :post_title, with: "This is just a test title"
      fill_in :post_contents, with: "And this is a test comment"
      attach_file('post_picture', File.absolute_path('./spec/claude.png'))
      click_on :commit
      expect(page).to have_content "This is just a test title"
      expect(page).to have_content "And this is a test comment"
      expect(page).to have_content "And this is a test comment"
      expect(page.find('img')['src']).to have_content 'claude.png'

     # http://127.0.0.1:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBHZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--b721d5c2e6b207cd616e7617d16ed6e7262614df/IMG_0298.jpg

    end


  end

#   feature "request to book" do
#   scenario "to be able to click book button" do
#     sign_up
#     adding_property
#     visit ('/')
#     click_link "Sign up"
#     fill_in :username, with: "bill"
#     fill_in :password, with: "123"
#     fill_in :email, with: "bill@email.com"
#     click_button "Confirm sign up"
#     click_button "Book property"
#     expect(page).to have_content "Here are your booking details"
#   end
