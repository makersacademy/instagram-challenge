require 'rails_helper'

feature 'gallery' do
context 'no pictures have been added' do
  scenario 'should display a prompt to add a picture' do
    visit '/gallery'
    expect(page).to have_content "No pictures yet"
    expect(page).to have_link "Add a gallery"
  end
end

end
