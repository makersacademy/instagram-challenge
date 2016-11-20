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
  end
end

feature 'deleting pictures' do
  scenario 'allows users to delete a picture using a form' do
    sign_up_and_sign_in
    create_a_gallery
    visit_a_gallery
    click_link 'Add Picture'
    fill_in "Title", with: "Oh my god!"
    click_button 'Create Picture'
    click_button 'Delete Picture'
    expect(page).not_to have_content('Another cute pic')
    expect(page).to have_content("Picture \"Another cute pic\" was successfully deleted")
  end

end
