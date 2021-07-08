require 'rails_helper'

RSpec.feature "User", type: :feature do

  scenario "must sign in to view users page" do
		visit('/users')
		expect(page).to have_current_path('/users/sign_in')
  end
end
