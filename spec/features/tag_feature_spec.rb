require 'rails_helper'

feature 'tags' do

  context 'Signing Up' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
      # @pictures = Picture.create(image: File.new('spec/fixtures/image.jpeg'), description: 'London')

      #  Picture.create(description: 'London')

      # @pictures = Picture.all
      # p @pictures.image = File.new('spec/fixtures/image.jpeg')
        # p @pictures.description
      # p @pictures.image
      # p @image = { :image => File.open(File.join(Rails.root, 'spec', 'fixtures', 'image.jpeg')) }
    end

  scenario 'Can add a tag to picture' do
      visit '/'
      click_link 'Add a picture'
      fill_in('tag', with: "Test" )
      click_button('Create Picture')
      expect(page).to have_content('Test')
      expect(page).to_not have_content('No pictures yet')
    end
  end
end
