require 'rails_helper'

feature 'endorsing reviews' do

  before do
    user = User.first
    user.travelgrams.create(name: 'Bali trip', comments: 'great time')
  end

  scenario 'a user can endorse a review, which updates the review endorsement count' do
    visit '/restaurants'
    click_link 'Endorse Review' #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 endorsement')
  end

end