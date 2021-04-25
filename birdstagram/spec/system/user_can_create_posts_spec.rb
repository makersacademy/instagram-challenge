require 'rails_helper'

RSpec.describe "User can create posts", type: :system do
  before do
    driven_by(:rack_test)
    login
  end

  xit 'allows a user to create a new post' do
    visit '/posts/new'
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
