require 'rails_helper'

context 'photos have been added' do
  before do
    Photo.create(title: 'Test Photo')
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    Photo.create(title: 'Test Photo')
  end

  scenario 'should display a prompt to add a comment' do
    visit '/photos'
    click_link 'Add photo'
    fill_in('Title', with: 'Test Photo')
    attach_file('Image', 'spec/files/images/testimage.jpg')
    click_button 'Create Photo'
    save_and_open_page
    expect(page).to have_content('Test Photo')
  end





end
