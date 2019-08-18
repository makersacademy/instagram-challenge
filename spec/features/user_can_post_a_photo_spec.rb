require_relative '../rails_helper'


RSpec.feature "Posting photos", type: :feature do
  xscenario 'A user can post a photo which will show on the photos page' do
    visit photos_url
    click_button('New photo')
    fill_in "image", with: ""
    click_link('Submit')
    expect(page.html).to have_content("")
  end
end
