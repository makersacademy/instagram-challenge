require 'rails_helper'

feature 'adding pictures' do
    # before { Picture.create title: 'Another cute pic' }
  scenario 'allows users to add a new picture using a form' do
    sign_up_and_sign_in
    create_a_gallery
    visit_a_gallery
    click_link 'Add Picture'
    fill_in "Title", with: "Oh my god!"
    click_button 'Create Picture'
    expect(page).to have_content('Oh my god!')
    expect(page).to have_content('The "Oh my god!" picture was successfully created')
  end
end

feature 'deleting pictures' do
  scenario 'allows users to delete a picture using a form' do
    sign_up_and_sign_in
    create_a_gallery
    visit_a_gallery
    click_link 'Add Picture'
    fill_in "Title", with: "Another cute pic"
    click_button 'Create Picture'
    click_link 'Delete Picture'
    expect(page).to have_content("The \"Another cute pic\" picture was successfully deleted")
  end
end

feature 'editing pictures' do
  scenario 'allows users to edit a picture using a form' do
    sign_up_and_sign_in
    create_a_gallery
    visit_a_gallery
    click_link 'Add Picture'
    fill_in "Title", with: "Another cute pic"
    click_button 'Create Picture'
    click_link 'Edit Picture'
    expect(page).to have_content("Edit picture")
    expect(page).to have_css("form.edit_picture")
  end
end
