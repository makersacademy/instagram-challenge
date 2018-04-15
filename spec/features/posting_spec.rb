
RSpec.feature "User posting", type: :feature do

  scenario "can post an image and see it" do
    testImageURL = "https://upload.wikimedia.org/wikipedia/commons/f/ff/Domestic_goat_kid_in_capeweed.jpg"
    visit "/"
    click_link "Post a Photo"
    fill_in "post[image_url]", with: testImageURL
    click_button "Post"
    expect(page).to have_css("img[src*='#{testImageURL}']")
  end
end
