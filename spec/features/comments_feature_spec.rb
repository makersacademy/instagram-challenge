require 'rails_helper'

feature 'commenting' do
  before do
    project = Project.create(name: 'Pipeline ILI', company: 'RB Geomatics')
    project.posts.create(description: 'A new post')
  end
  context 'a user is signed in' do
    before do
      visit '/'
      click_link('Sign up')
      fill_in('Email', with: 'test@test.com')
      fill_in('Password', with: 'testing1')
      fill_in('Password confirmation', with: 'testing1')
      click_button('Sign up')
    end
    scenario 'allows users to leave a review' do
      fill_in "Feedback", with: "Top H&S considerations, great work!"
      click_button 'Submit'
      expect(current_path).to eq '/projects'
      expect(page).to have_content "Top H&S considerations, great work!"
    end
  end
end