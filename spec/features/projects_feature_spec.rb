require 'rails_helper'

feature 'projects' do
  context 'no projects added' do
    scenario 'should display that there are no projects' do
      visit '/projects'
      expect(page).to have_content 'No projects added yet'
      expect(page).to have_link 'Add a Project'
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

  context 'creating projects' do
    scenario 'user can fill in a form for a new project and it is displayed' do
      visit '/projects'
      click_link 'Add a Project'
      fill_in 'Name', with: 'Pipeline Pigging'
      fill_in 'Company', with: 'RB Geomatics'
      click_button 'Create Project'
      expect(page).to have_content('Project: Pipeline Pigging')
      expect(page).to have_content('Company: RB Geomatics')
      expect(current_path).to eq '/projects'
    end
  end

  context 'viewing projects' do
    let!(:pipeline){ Project.create(name:'Pipeline Pigging', company:'RB Geomatics') }

    scenario 'lets a user view a particular project' do
      visit '/projects'
      click_link 'Pipeline Pigging'
      expect(page).to have_content('Pipeline Pigging')
      expect(current_path).to eq "/projects/#{pipeline.id}"
    end
  end

  context 'deleting projects' do
    before do
      Project.create(name:'Pipeline Pigging', company:'RB Geomatics')
    end

    scenario 'removes a project on clicking the delete link' do
      visit '/projects'
      click_link 'Delete Pipeline Pigging'
      expect(page).not_to have_content 'Pipeline Pigging'
      expect(page).to have_content 'Project successfully deleted'
    end
  end

  context 'can add a photo to a project' do
    scenario 'photo is displayed in timeline' do
      visit '/projects'
      click_link 'Add Photo'
      fill_in 'Description', with:'Cleaning Pig Insertion'
      attach_file('post_photo', 'spec/pig_test.jpg')
      click_buttton 'Upload Photo'
      expect(current_path).to eq '/projects'
      expect(page).to have_xpath("//img[@alt='pig_test']")
    end
  end
end