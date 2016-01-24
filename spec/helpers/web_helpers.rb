def add_listing(day: "Monday")
  click_link "Add a class"
  fill_in "listing_day", with: day
  select 10, from: "listing_hour"
  select 0, from: "listing_mins"
  click_button "Create Listing"
end

def sign_up(  email: "test@example.com",
              name: "Tippee Toes",
              password: "password")
  visit "/users/sign_up"
  fill_in "user_email", with: email
  fill_in "user_provider_name", with: name
  fill_in "user_password", with: password
  fill_in "user_password_confirmation", with: password
  click_button "Sign up"
end
