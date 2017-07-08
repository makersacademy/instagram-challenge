require 'rails_helper'

RSpec.feature "User as a profile picture", type: :feature do
  scenario "There is a upload pic option when signin up" do
    visit sign_up_path
    expect(page).to have_field 'user_profile_picture'
  end
end
