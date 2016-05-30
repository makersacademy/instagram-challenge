require 'rails_helper'
require 'picture'
require 'web_helper'

feature 'pictures' do
  context 'no picture have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add Picture'
    end
  end

  scenario 'can create a picture' do
    my_sign_up
    visit '/pictures'
    click_link 'Add Picture'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'nom nom nom #coffeetime' 
    click_button 'Create Picture'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  scenario 'needs an image to create a post' do 
    my_sign_up 
    visit '/pictures'
    click_link 'Add Picture'
    fill_in 'Caption', with: "Thermostat"
    click_button 'Create Picture'
    expect(page).to have_content('You need an image to post here!')
  end 

  context 'Index displays a list of pictures' do  
    scenario 'the index displays correct created job information' do
      job_one = create(:picture, caption: "This is post one")
      job_two = create(:picture, caption: "This is the second post")

      visit '/pictures'
      expect(page).to have_content("This is post one")
      expect(page).to have_content("This is the second post")
      expect(page).to have_css("img[src*='coffee']")
    end
  end

  context 'editing pictures' do

    before { create(:picture) }
    scenario 'let a user edit a picture' do
      my_sign_up
      visit '/pictures'
      click_link 'Edit'
      fill_in 'Caption', with: 'Updated pic'
      click_button 'Update Picture'
      expect(page).to have_content 'Updated pic'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting pictures' do

    before { create(:picture) }

    scenario 'removes a picture when a user clicks a delete link' do
      my_sign_up
      visit '/pictures'
      click_link 'Delete'
      expect(page).not_to have_content 'nofilter'
      expect(page).to have_content 'Picture deleted successfully'
    end

  end
end