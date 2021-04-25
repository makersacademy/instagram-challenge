require 'rails_helper'
require_relative 'helper_methods'

RSpec.describe "User can logout", type: :system do
  before do
    driven_by(:rack_test)
    sign_up
    login
  end
  it 'allows a user to logout' do
    click_button 'Logout'
    expect(page).not_to have_content ('Hello, rio')
  end
  it "doesn't display a logout button if the user is logged out" do
    click_button 'Logout'
    expect(page).not_to have_button ('Logout')
    expect(page).not_to have_button ('New Post')
  end
end
