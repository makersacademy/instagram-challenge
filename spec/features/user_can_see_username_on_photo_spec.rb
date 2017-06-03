require 'rails_helper'

RSpec.feature "Photos",  type: :feature do

  scenario "can see a their username next to a photo", type: :feature do
    skip
    sign_up
    upload_photo
    expect(page).to have_content("user")
  end

end
