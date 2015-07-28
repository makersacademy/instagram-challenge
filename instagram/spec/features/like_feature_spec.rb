require 'rails_helper'
require 'helpers'

feature 'likes' do
  before {Picture.create description: 'berries'}

  context 'likes can be added' do
    scenario 'a user can endorse a review, which increments the endorsement count', js: true do
      sign_in
      click_link 'Like picture'
      expect(page).to have_content('1 Like')
    end
  end


end
