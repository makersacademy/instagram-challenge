require 'rails_helper'
require_relative 'sign_up_helper_spec'

RSpec.feature "Logout", type: :feature do
  scenario "User can logout" do
    sign_up_kiki
    click_button "Logout"
    expect(current_path).to eq root_path
    expect(page).not_to have_content "You are logged in as Kiki"
  end
end
