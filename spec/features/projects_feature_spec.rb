require 'rails_helper'

feature 'projects' do
  context 'no projects added' do
    scenario 'should display that there are no projects' do
      visit '/projects'
      expect(page).to have_content 'No projects added yet'
      expect(page).to have_link 'Add a project'
    end
  end
end