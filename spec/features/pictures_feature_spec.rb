require 'rails_helper'

feature 'pictures' do
  scenario 'Should display a prompt to add a picture' do
    visit '/pictures'
    expect(page).to have_link 'Add a picture'
  end

  scenario 'user can fill out a form to add a picture' do
    visit '/pictures'
    click_link 'Add a picture'
    fill_in 'Description', with: 'What a cool picture'
    click_button 'Create Picture'
    expect(page).to have_content 'What a cool picture'
    expect(current_path).to eq '/pictures'
  end

  context 'picture has been added' do
    before do
      Picture.create(description: 'Look at my dinner')
    end

    scenario 'display picture descriptions' do
      visit '/pictures'
      expect(page).to have_content('Look at my dinner')
    end
  end
end
