require 'rails_helper'

feature "Sign in" do


  scenario 'has a form' do
    visit '/posts'
    click_button 'New'
    fill_in :title, with: "Test title"
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
# end

end
