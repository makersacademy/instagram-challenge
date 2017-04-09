require 'rails_helper'

context 'editing pictures' do

  before do
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
  end

  scenario 'let a user edit a picture' do
    visit '/pictures'
    click_link 'Edit'
    fill_in 'Description', with: 'My Edited Test'
    click_button 'Update Picture'
    click_link 'My Edited Test'
    expect(page).to have_content 'My Edited Test'
    expect(page).to_not have_content 'Test Upload'
  end
end
