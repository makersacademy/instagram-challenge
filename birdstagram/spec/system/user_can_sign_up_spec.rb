require 'rails_helper'

RSpec.describe "User can sign up", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'shows the user a page for their username and password' do
    visit '/users/new'
    fill_in 'user_username', with: 'rio'
    fill_in 'user_password', with: 'bells'
    fill_in 'user_email', with: 'rio@example.com'
    click_button 'Sign Up'
    expect(page).to have_content ('Hello, rio')
    user_instance = User.order("id").last

    expect(user_instance.username).to eq('rio')
    expect(user_instance.email).to eq('rio@example.com')
  end
end
