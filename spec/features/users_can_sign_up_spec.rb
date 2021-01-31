require 'rails_helper'
require_relative 'sign_up_helper_spec'

RSpec.feature "New User", type: :feature do
  scenario "Can sign up" do
    sign_up_kiki
    expect(current_path).to eq root_path
    expect(page).to have_content "You are logged in as Kiki"
  end
end
