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
  end







end
