require 'rails_helper'

feature 'turtlegrams' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a turtlegram' do
      visit '/turtlegrams'
      expect(page).to have_content 'No turtlegrams yet'
      expect(page).to have_content 'Add a turtlegram'
    end
  end

  context 'turtlegrams have been added' do
    before {Turtlegram.create(caption: 'Shelly', image: File.new(File.join(Rails.root,"public/uploads/turtlegram/image/1/turtle.jpg")))}
      scenario 'displays a turtlegram on a feed' do
      visit '/turtlegrams'
      expect(page).to have_content('Shelly')
      expect(page).not_to have_content('No turtlegrams yet')
    end
  end
end
