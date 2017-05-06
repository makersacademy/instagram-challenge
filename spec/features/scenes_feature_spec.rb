require 'rails_helper'

feature 'scenes' do
  context 'no scenes should have been added' do
    scenario 'should display a prompt to add a scene' do
      visit '/scenes'
      expect(page).to have_content 'No scenes yet'
      expect(page).to have_link 'Add a scene'
    end
  end

context 'scenes have been added' do
  before do
    Scene.create(title: 'Sunset')
  end

  scenario 'display scenes' do
    visit '/scenes'
    expect(page).to have_content('Sunset')
    expect(page).not_to have_content('No restaurants yet')
  end
end

end
