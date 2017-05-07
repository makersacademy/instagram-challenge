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
    expect(page).not_to have_content('No scenes yet')
  end
end

context 'creating scenes' do
  scenario 'prompts user to fill out a form, then displays the new scene' do
    visit '/scenes'
    click_link 'Add a scene'
    fill_in 'Title', with: 'Waves'
    click_button 'Create Scene'
    expect(page).to have_content 'Waves'
    expect(current_path).to eq '/scenes'
  end
end

context 'viewing scenes' do
  let!(:waves){ Scene.create(title:'Waves') }

  scenario 'lets a user view a scene' do
    visit '/scenes'
    click_link 'Waves'
    expect(page).to have_content 'Waves'
    expect(current_path).to eq "/scenes/#{waves.id}"
  end
end

context 'editing scenes' do
  before { Scene.create title: 'Tree', id: 1 }

  scenario "let a user edit a scene's title" do
    visit '/scenes'
    click_link 'Edit Tree'
    fill_in 'Title', with: 'Birch'
    click_button 'Update Scene'
    click_link 'Birch'
    expect(page).to have_content 'Birch'
    expect(current_path).to eq '/scenes/1'
  end
end

end
