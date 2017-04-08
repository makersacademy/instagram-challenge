require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been uploaded' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'picture image and location has been added' do
    before do
      Picture.create(description: 'London')
      @image = { :image => File.open(File.join(Rails.root, 'spec', 'fixtures', 'image.jpeg')) }
    end

    # unsure how to write test testing paperclip upload

    # scenario 'displays image' do
    #   visit '/pictures'
    #   p @image
    #   Picture.create :image => File.open(File.join(Rails.root, 'spec', 'fixtures', 'image.jpeg'))
    #   expect(page).to have_xpath(":image=>#<File:/Users/ChristosMAC/Github/Makers/Week 8/instagram-challenge/spec/fixtures/image.jpeg>")
    # end

    scenario 'display picture description' do
      visit '/pictures'
      expect(page).to have_content('London')
      expect(page).to_not have_content('No pictures yet')
    end
  end
end
