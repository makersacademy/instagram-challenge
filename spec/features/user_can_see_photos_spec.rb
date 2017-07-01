require 'rails_helper'

RSpec.feature "User can see photos" do

  before(:each) { create_photo }

  scenario "user visits the photos page" do
    sign_in
    visit photos_url
    expect(page).to have_content('Yosemite')
  end
end
