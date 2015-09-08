require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to post a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Post picture'
    end
  end

  context 'pictures have been posted' do
    before do
      Picture.create(title: 'Holiday')
  end

    scenario 'display pictures titles' do
      visit '/pictures'
      expect(page).to have_content('Holiday')
      expect(page).not_to have_content('No pictures yet')
    end

  end

  context 'creating pictures' do
      scenario 'prompts user to fill out a form, then displays the new picture' do
        visit'/pictures'
        click_link 'Post picture'
        fill_in 'Title', with: 'Holiday'
        click_button 'Create Picture'
        expect(page).to have_content 'Holiday'
        expect(current_path).to eq '/pictures'
      end
  end

end