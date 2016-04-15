require 'rails_helper'

feature 'pictures' do
  scenario 'no pictures have been added' do
    visit '/pictures'
    expect(page).to have_content 'No pictures yet!'
    expect(page).to have_link 'Add pictures'
  end
end
