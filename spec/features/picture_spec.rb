require 'rails_helper'
feature 'homepage' do
context 'No pictures have been added' do
scenario ' users should be asked to add a picture'do
visit '/pictures'
expect(page).to have_content('No pictures added yet')
expect(page).to have_link('Add a picture')
end
end

context "Adding a picture" do
  before do
    Picture.create(title: 'cute dog', filename: 'dogthinkstock.jpg')
  end
  scenario 'display picture and title' do
   visit '/pictures'
   expect(page).to have_content('cute dog')
   expect(page).not_to have_content('No pictures added yet')
  end
end

context "creating a form"  do
  scenario ' a users fill in a form and the page displays the picture and title'do
    visit '/pictures'
    click_link('Add a picture')
    fill_in "Title", with: "cute dog"
    fill_in 'Filename', with: 'dogthinkstock.jpg'
    click_button 'Create Picture'
    expect(page).to have_content('cute dog')
  end
end
end
