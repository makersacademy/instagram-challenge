module Helpers

  def add_picture(picture)
    visit '/pictures'
    click_link("Add a picture")
    attach_file("Upload Your Picture", Rails.root + picture[:filepath])
    fill_in "Description", with: picture[:description]
    click_button "Add Picture"
  end

end
