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
  # expect(page).to have_xpath("//img[contains(@src,'assets/pictures/dogthinkstock.jpg')]")
end
end

context "viewing the picture" do
  let!(:dog){Picture.create(title: 'Dog', filename: 'dogthinkstock.jpg')}
  scenario "lets a user view the picture's page" do
    visit "/pictures"
    click_link'Dog'
    expect(page).to have_content('Dog')
    expect(current_path).to eq "/pictures/#{dog.id}"
  end
end
context "editing the title of a picture" do
  before do
    Picture.create(title: 'cute dog', filename: 'dogthinkstock.jpg')
  end
  scenario " lets the user rename their picture" do
    visit "/pictures"
    click_link 'cute dog'
    click_link 'Edit title'
    fill_in 'Title', with: 'doggie'
    click_button 'Submit change'
    expect(page).to have_content('doggie')
  end
end
context 'deleting a post' do
  before do
    Picture.create(title: 'cute dog', filename: 'dogthinkstock.jpg')
  end
  scenario 'allowing a user to delete the image and title they posted' do
    visit"/pictures"
    click_link 'cute dog'
    click_link 'Delete post'
    expect(page).not_to have_content('cute dog')
    expect(page).to have_content('Deleted post')
  end
end
# context 'adding a like button'do
#   scenario 'the user can like the photo' do
#     visit '/pictures'
#     click_button 'like'
#     expect(something).to change_by(1)
#   end
# end
end
