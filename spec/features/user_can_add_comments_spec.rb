require 'rails_helper'

RSpec.feature "Comments",  type: :feature do

  scenario "can see profile page", type: :feature do
    sign_up(username = "Sophie")
    upload_photo
    add_comment(comment = "What a lovely picture!")
    page.should have_content("What a lovely picture!")
  end

end
