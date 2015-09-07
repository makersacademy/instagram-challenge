module Helpers

  def sign_up(email: email="test@email.co.uk")
    click_link "Sign up"
    fill_in "Email", with: "Test@email.co.uk"
    fill_in "Username", with: "Tester"
    fill_in "Password", with: "testtest"
    fill_in "Password confirmation", with: "testtest"
    click_button "Sign up"
    click_link "My Photos"
  end

  def add_photo
    click_link "Add photo"
    fill_in "Title", with: "Beach photo"
    fill_in "Description", with: "Not actually a photo to do with the beach"
    attach_file "photo_image", Rails.root.join("spec","fixtures", "test_photo.png")
    click_button "Add Photo"
  end

end