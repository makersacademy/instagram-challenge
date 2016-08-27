require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures added yet'
      expect(page).to have_content 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Pictures.create(name:'cat_in_hat.jpg'
                      description:'My cat wearing my hat'
                      image:'storage/imgs/cat_in_hat.jpg')
    end

    scenario 'display picture' do
      visit '/pictures'
      expect(page).to have_content('Cat in Hat')
      expect(page).not_to have_content('No pictures added yet')
    end
  end
end
