require 'rails_helper'

RSpec.feature "User",  type: :feature do

  scenario "can see profile page", type: :feature do
    sign_up(username = "Sophie")
    click_on 'Profile'
    page.should have_content("Sophie")
  end

end
