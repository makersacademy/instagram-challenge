require 'rails-helper'

feature 'gifs' do
  context 'no gifs have been added' do
    scenario 'should display a prompt to add a gif' do
      visit '/restuarants'
      expect(page).to have_content 'No gifs yet!'
      expect(page).to have_link 'Give a gif'
    end
  end
end
