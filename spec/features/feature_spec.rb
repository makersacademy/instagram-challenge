require 'rails_helper'

feature 'feed' do
  context 'no filterspams have been posted' do
    scenario 'should display the welcome message' do
      visit '/'
      expect(page).to have_content 'No filterspams :('
    end
  end
end
