require 'rails_helper'

RSpec.feature "User can see photos" do

  before(:each) do
    create_photo
  end

  scenario "user visits the photos page" do
    expect(page).to have_content('Yosemite')
  end
end
