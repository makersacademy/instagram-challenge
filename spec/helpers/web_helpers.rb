def add_listing
  visit "/listings"
  click_link "Add a class"
  fill_in "listing_day", with: "Monday"
  select 10, from: "listing_hour"
  select 0, from: "listing_mins"
  click_button "Create Listing"
end
