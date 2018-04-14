
RSpec.feature "User posting", type: :feature do

  scenario "can post an image and see it" do
    testImageURL = "https://upload.wikimedia.org/wikipedia/commons/f/ff/Domestic_goat_kid_in_capeweed.jpg"
    visit "/"
    click_link "New post"
    fill_in "imageURL", with: testImageURL
    click_button "Submit"
    expect(page).to have_content(testImageURL)
  end
end
