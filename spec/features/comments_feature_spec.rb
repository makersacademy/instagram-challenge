require 'rails_helper'
require 'helper_methods'
require 'support/features/clearance_helpers'

# include Rack::Test::Methods

RSpec.feature 'Comments', type: :feature do
  before(:each) do
    sign_in
    @current_user = User.last
    add_snap(@current_user)
    visit '/snaps'
    click_link("Show more")
    add_comment('Hello world!')
  end

  scenario 'Can see my comment' do
    expect(page).to have_content('Hello world!')
  end

  it 'can be deleted' do
    expect(page).to have_content('Hello world!')
    click_link "Delete comment"
    expect(page).to_not have_content('Hello world!')
  end

end
