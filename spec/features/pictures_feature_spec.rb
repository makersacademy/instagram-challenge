require 'rails_helper'

feature 'Pictures' do

  context 'when there are no pictures' do

    scenario 'should have a prompt to add a picture' do
      visit '/'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end

  end

end
