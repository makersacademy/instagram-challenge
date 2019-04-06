# require 'rails_helper'

# RSpec.feature "View posts", type: :feature do
#     user_email = "bob@bob.com"
#     user_password = "1234567890"
#     scenario "posts are viewed when user signs up" do
#         post = Post.create(message: "abcdefg")
#         visit "/"
#         click_link "Sign up"
#         fill_in "Email", with: user_email
#         fill_in "Password", with: user_password
#         fill_in "Password confirmation", with: user_password
#         length =  User.all.length
#         click_button "Sign up"
#         expect(page).to have_content("abcdefg")
#     end
# end 