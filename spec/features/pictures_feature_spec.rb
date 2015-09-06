require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do
    scenario 'should display prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content('No pictures yet')
      expect(page).to have_link('Add a picture')
    end
  end

  context 'pictures have been added' do
    scenario 'display pictures' do
      visit '/pictures'
      click_link('Add a picture')
      page.attach_file 'picture[image]', 'spec/assets/images/respect.jpg'
      fill_in 'Name', with: 'respect!'
      click_button 'Create Picture'
      expect(page).to have_content('respect!')
      expect(page).to have_selector('img')
    end
  end

  context 'deleting pictures' do
    scenario 'pictures can be deleted' do
      visit '/pictures'
      click_link('Add a picture')
      page.attach_file 'picture[image]', 'spec/assets/images/respect.jpg'
      fill_in 'Name', with: 'respect!'
      click_button 'Create Picture'
      click_link('Delete image')
      expect(page).not_to have_content('respect!')
      expect(page).not_to have_selector('img')
    end
  end

  scenario 'comments are deleted alongside a Picture' do
    visit '/pictures'
    click_link('Add a picture')
    page.attach_file 'picture[image]', 'spec/assets/images/respect.jpg'
    fill_in 'Name', with: 'respect!'
    click_button 'Create Picture'
    click_link('Comment')
    fill_in('Thoughts', with:'cool pic')
    click_button('Leave Comment')
    click_link('Delete image')
    expect(page).not_to have_content('cool pic')
  end
end
