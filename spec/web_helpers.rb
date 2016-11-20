def upload_picture
  visit '/pictures/new'
  fill_in "Description", with: "Loch Hope"
  attach_file "picture_image", "spec/asset_specs/photos/photo.jpg"
  click_button "Upload Picture"
end

def create_user_picture
  @rick = User.create(name: "rick", email: "asda@example.com", password: "foobar", password_confirmation: "foobar")
  @picture = @rick.pictures.create(description: 'Loch Lomond')
end
