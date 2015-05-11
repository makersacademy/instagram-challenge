require 'rails_helper'

feature 'projects' do
  context 'a user is signed in' do
    before do
      visit '/'
      click_link('Sign up')
      fill_in('Email', with: 'test@test.com')
      fill_in('Password', with: 'testing1')
      fill_in('Password confirmation', with: 'testing1')
      click_button('Sign up')
    end

    context 'no projects added' do
      scenario 'should display that there are no projects' do
        visit '/projects'
        expect(page).to have_content 'No projects added yet'
        expect(page).to have_link 'Add a Project'
      end
    end

    context 'projects added' do
      before do
        Project.create(name:'Pipeline ILI', company:'RB Geomatics')
      end

      scenario 'displays projects' do
        visit '/projects'
        expect(page).to have_content('Project: Pipeline ILI')
        expect(page).to have_content('Company: RB Geomatics')
        expect(page).not_to have_content('No projects added yet')
      end
    end

    context 'creating projects' do
      scenario 'user can fill in a form for a new project and it is displayed' do
        visit '/projects'
        click_link 'Add a Project'
        fill_in 'Name', with: 'Pipeline ILI'
        fill_in 'Company', with: 'RB Geomatics'
        click_button 'Create Project'
        expect(page).to have_content('Project: Pipeline ILI')
        expect(page).to have_content('Company: RB Geomatics')
        expect(current_path).to eq '/projects'
      end
    end

    context 'viewing projects' do
      let!(:pipeline){ Project.create(name:'Pipeline ILI', company:'RB Geomatics') }

      scenario 'lets a user view a particular project' do
        visit '/projects'
        click_link 'Pipeline ILI'
        expect(page).to have_content('Pipeline ILI')
        expect(current_path).to eq "/projects/#{pipeline.id}"
      end
    end

    context 'deleting projects' do
      before do
        Project.create(name:'Pipeline ILI', company:'RB Geomatics')
      end

      scenario 'removes a project on clicking the delete link' do
        visit '/projects'
        click_link 'Delete Pipeline ILI'
        expect(page).not_to have_content 'Pipeline ILI'
        expect(page).to have_content 'Project successfully deleted'
      end
    end

    context 'can add a photo to a project' do
      before do
        Project.create(name:'Pipeline ILI', company:'RB Geomatics')
      end
      scenario 'photo is displayed in timeline' do
        visit '/projects'
        click_link 'Add Photo to Pipeline ILI'
        fill_in 'Description', with:'Cleaning PIG Insertion'
        attach_file('post_image', 'spec/test_pig.jpg')
        click_button 'Upload Photo'
        expect(current_path).to eq '/projects'
        expect(page).to have_content 'Cleaning PIG Insertion'
        expect(page).to have_xpath("//img[contains(@src, 'test_pig.jpg')]")
      end
    end
  end

  context 'a user is signed out' do
    context 'no projects added' do
      scenario 'should not display that there are no projects' do
        visit '/projects'
        expect(page).not_to have_content 'No projects added yet'
        expect(page).not_to have_link 'Add a Project'
      end
    end
  end

end
