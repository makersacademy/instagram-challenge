def post_image(title = "New Photo", image = "test_image.png")
    visit("/")
    click_button ("New Photo")
    fill_in "photo_title", with: title
    attach_file("photo_image_file", Rails.root + "spec/support/images/#{image}")
    click_button "Save Photo"
end