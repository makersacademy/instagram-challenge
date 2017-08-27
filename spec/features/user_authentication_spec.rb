require 'rails_helper'

RSpec.feature "User", type: :feature do
  let!(:user) { create(:user) }

  scenario "user can sign up" do
    sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

end
