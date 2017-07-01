RSpec.feature "Post a Photo", type: :feature do

  scenario "Can submit a photo and view it" do
    visit("/")
    click_button ("New Photo")
    fill_in "photo_title", with: "New Photo"
    attach_file("photo_image_file", Rails.root + "spec/support/images/test_image.png")
    click_button "Save Photo"
    expect(page).to have_content("New Photo")
    expect(page).to have_xpath("//img[contains(@src,'test_image.png')]")
  end
end