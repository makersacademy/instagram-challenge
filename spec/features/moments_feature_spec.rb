require 'rails_helper'

feature 'sharing moments' do
  context 'no moments have been shared' do
    scenario 'a user can upload a moment' do
      visit '/moments'
      expect(page).to have_content('No moments have been shared yet')
      expect(page).to have_link('Share a moment')
    end
  end

  context 'a moment has been shared' do
    before do
      Moment.create(description: 'something profound')
    end

    scenario 'displays all the moments' do
      visit '/moments'
      expect(page).to have_content('something profound')
    end

  end
end
