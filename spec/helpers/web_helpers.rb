def add_listing
  visit "/listings"
  click_link "Add a class"
  fill_in "listing_day", with: "Monday"
  select 10, from: "listing_hour"
  select 0, from: "listing_mins"
  click_button "Create Listing"
end

def sign_up (email: "test@example.com", password: "password")
  visit "/users/sign_up"
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Password confirmation", with: password
  click_button "Sign up"
end
