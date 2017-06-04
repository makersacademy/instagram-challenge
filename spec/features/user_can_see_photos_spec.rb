require 'rails_helper'

RSpec.feature "Photos",  type: :feature do

  scenario "can see a photo on the front page after upload", type: :feature do
    sign_up
    upload_photo
    expect(page).to have_content("Photo was successfully created")
  end

end
