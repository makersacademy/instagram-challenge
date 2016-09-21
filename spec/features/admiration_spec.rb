require 'rails_helper'

feature 'admire photographs' do
  before do
    photograph_upload
  end

  it 'a user can endorse a review, which increments the endorsement count', js: true do
    visit '/photographs'
    click_link 'Admire Photograph'
    expect(page).to have_content("1 admiration")
  end
end
