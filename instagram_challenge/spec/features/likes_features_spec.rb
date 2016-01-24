require 'rails_helper'

feature 'liking comments' do
  before do
    nyc = Photo.create(caption: 'NYC')
  end

  # scenario 'a user can endorse a review, which updates the review endorsement count', js: true do
  #   visit '/photos'
  #   click_link 'Like Comment' #are we endorsing restaurants or the review of the restaurants?
  #   expect(page).to have_content('1 like')
  # end

end
