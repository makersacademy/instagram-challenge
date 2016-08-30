require 'rails_helper'


feature 'admire photographs' do
  before do
    photograph_upload
  end

  scenario 'a user can admire a review, which updates count' do
    visit '/photographs'
    click_link 'Admire Photograph'
    expect(page).to have_content('1 admiration')
  end

end
