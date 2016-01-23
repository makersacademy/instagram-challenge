def add_listing
  visit "/listings"
  click_link "Add a class"
  fill_in "listing_day", with: "Monday"
  fill_in "listing_hour", with: 10
  fill_in "listing_mins", with: 0
  click_button "Create Listing"
end
