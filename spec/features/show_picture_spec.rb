require 'rails_helper'


context 'viewing picture' do

  scenario 'lets a user view a picture' do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')

    visit '/pictures'
    click_link 'Add a picture'
  attach_file('Image', "spec/fixtures/image.jpeg")
  fill_in 'Description', with: 'Test Upload'
  click_button 'Create Picture'
   visit '/pictures'
   click_link 'Test'
   expect(page).to have_content 'Test Upload'
  end

end
