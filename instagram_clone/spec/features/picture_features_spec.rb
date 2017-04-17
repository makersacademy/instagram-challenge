require 'rails_helper'

feature 'pictures' do 
  context 'no picures have been added' do 
    scenario 'should display a promp to add a picture' do 
    visit '/pictures'
    expect(page).to have_content 'No Photos added yet'
    expect(page).to have_link 'Add a Photo'
    end 
  end 
end 