require_relative './helpers/photo_feature_helpers_spec'

RSpec.feature "Post a Photo", type: :feature do

  scenario "Can submit a photo and view it" do
    post_image
    expect(page).to have_content("New Photo")
    expect(page).to have_xpath("//img[contains(@src,'test_image.png')]")
  end

  scenario "Can see a list of photos" do
    post_image
    post_image("Second", "test_image_2.png")
    visit("/")
    expect(page).to have_content("New Photo")
    expect(page).to have_xpath("//img[contains(@src,'test_image.png')]")
    expect(page).to have_content("Second")
    expect(page).to have_xpath("//img[contains(@src,'test_image_2.png')]")
  end

  scenario "Can select an image to view" do
    post_image
    visit("/")
    within("##{most_recent_photo.id}") do
      click_link ("Show")
    end
    expect(current_path).to eq("/photos/#{most_recent_photo.id}")
    expect(page).to have_content("New Photo")
    expect(page).to have_xpath("//img[contains(@src,'test_image.png')]")
  end
end