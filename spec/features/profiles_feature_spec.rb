require 'rails_helper'
require 'helper_methods'
require 'support/features/clearance_helpers'

# include Rack::Test::Methods

RSpec.feature 'Profiles', type: :feature do
  before(:each) do
    sign_in
    @current_user = User.last
    add_snap(@current_user)
    click_link 'Profile'
  end

  scenario 'Can see my profile' do
    expect(page).to have_content(@current_user.email)
    expect(page).to have_content('Snaps from this user')

  end
end
