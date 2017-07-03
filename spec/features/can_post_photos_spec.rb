require_relative './helpers/photo_feature_helpers_spec'

RSpec.feature "Post a Photo", type: :feature do

  scenario "Can submit a photo and view it" do
    post_image
    expect(page).to have_content("New Photo")
    expect(page).to have_xpath("//img[contains(@src,'test_image.png')]")
  end

   scenario "Can't submit a file that's not an image" do
    post_image("text", "test.txt")
    expect(page).not_to have_content("Text")
  end

  scenario "Can't submit photo without title" do
    sign_up
    visit("/")
    click_button ("New Photo")
    attach_file("photo_image_file", Rails.root + "spec/support/images/test_image.png")
    click_button "Save Photo"
    expect(page).not_to have_content("New Photo")
  end

  scenario "Can't submit photo without file" do
    sign_up
    visit("/")
    click_button ("New Photo")
    fill_in "photo_title", with: "New Photo"
    click_button "Save Photo"
    expect(page).not_to have_content("New Photo")
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

  scenario "Newer photos appear first" do
    post_image
    post_image("Second", "test_image_2.png")
    visit("/")
    expect("Second by Test_User").to appear_before("New Photo by Test_User")
  end

  scenario "Photos show their created at date on index" do
    post_image
    visit("/")
    expect(page).to have_content("Posted: #{Time.now.strftime("%d/%m/%Y %H:%M")}")
  end

  scenario "Can select an image to view" do
    show_image
    expect(current_path).to eq("/photos/#{most_recent_photo.id}")
    expect(page).to have_content("New Photo")
    expect(page).to have_xpath("//img[contains(@src,'test_image.png')]")
  end

  scenario "Photos show their created at date on show" do
    show_image
    expect(page).to have_content("Posted: #{Time.now.strftime("%d/%m/%Y %H:%M")}")
  end

  scenario "Can go back to index from show" do
    show_image
    click_button("Go Back")
    expect(current_path).to eq("/photos")
  end

  scenario "Can't post photo unless logged in" do
    log_out
    visit("/")
    expect(page).not_to have_content("New Photo")
    visit("photos/new")
    expect(current_path).to eq("/")
  end

  scenario "Can see user name on photo" do
    post_image
    expect(page).to have_content("New Photo by Test_User")
  end
end