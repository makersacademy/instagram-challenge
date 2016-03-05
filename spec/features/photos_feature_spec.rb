require 'rails_helper'

xfeature 'Homepage photo view' do
  context 'No photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/'
      expect(page).to have_content "Nobody is using our site :'("
      expect(page).to have_link 'Need InstaGratification? Click here'
    end
  end
end
