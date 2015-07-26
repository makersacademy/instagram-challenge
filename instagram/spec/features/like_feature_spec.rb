require 'rails_helper'

feature 'likes' do
  before do
    berries = Picture.create(description: 'berries')
    berries.comments.create(words: 'Looks good')
  end

  context 'likes can be added' do
    scenario 'I can add a like to a picture' do
      visit '/pictures'
      click_link 'Like picture'
      expect(page).to have_content '1 Like'
    end
  end
end
