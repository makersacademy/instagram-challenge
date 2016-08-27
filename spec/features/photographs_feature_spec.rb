require 'rails_helper'

feature 'photographs' do
  context 'no photographs have been added' do
    scenario 'should display a prompt to add a photograph' do
      visit '/photographs'
      expect(page).to have_content 'No photographs yet'
      expect(page).to have_link 'Add a photograph'
    end
  end

  context 'photographs have been added' do
  before do
    Photograph.create(name: 'Ocean')
  end

  scenario 'display photograph' do
    visit '/photographs'
    expect(page).to have_content('Ocean')
    expect(page).not_to have_content('No restaurants yet')
  end
end

  context 'creating photographs' do
    scenario 'prompts user to fill out a form, then displays the new photographs' do
      visit '/photographs'
      click_link 'Add a photograph'
      attach_file "photograph_image", "spec/spec_assets/2395_What_causes_waves_in_the_ocean.jpg"
      fill_in 'Name', with: 'Ocean'
      click_button 'Create Photograph'
      expect(page).to have_content 'Ocean'
      expect(page).to have_selector("img")
      expect(current_path).to eq '/photographs'
    end
  end
end
