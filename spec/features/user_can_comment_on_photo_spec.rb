require_relative '../rails_helper'

RSpec.feature "Commenting on photos", type: :feature do
  xscenario 'A user make a comment on a photo' do
    # Need to add a photo here
    visit photos_url
    click_link('Comment')
    fill_in'comment', with: "Test comment"
    expect(page.html).to have_content("Test comment")
  end
end
