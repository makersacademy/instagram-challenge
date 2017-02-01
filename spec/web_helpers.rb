module Helpers

  def add_picture(picture)
    click_link("Add a picture")
    attach_file("Upload Your Picture", Rails.root + picture[:filepath])
    fill_in "Description", with: picture[:description]
    click_button "Add Picture"
  end

  def sign_up(user)
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: user[:email])
    fill_in('Password', with: user[:password])
    fill_in('Password confirmation', with: user[:password])
    click_button('Sign up')
  end

end
