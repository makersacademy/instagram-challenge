require 'rails_helper'

feature 'projects' do
  context 'no projects added' do
    scenario 'should display that there are no projects' do
      visit '/projects'
      expect(page).to have_content 'No projects added yet'
      expect(page).to have_link 'Add a project'
    end
  end

  context 'projects added' do
    before do
      Project.create(name:'Pipeline Pigging', company:'RB Geomatics')
    end

    scenario 'displays projects' do
      visit '/projects'
      expect(page).to have_content('Project: Pipeline Pigging')
      expect(page).to have_content('Company: RB Geomatics')
      expect(page).not_to have_content('No projects added yet')
    end
  end
end