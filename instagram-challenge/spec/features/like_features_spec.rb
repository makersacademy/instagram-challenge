require 'rails_helper'

describe 'liking posts' do

before { Picture.create(description:'New picture') }
before do
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

  it 'increments the like count of pictures' do
    visit '/pictures'
    click_link '♥ 0'
    expect(page).to have_content 'liked ♥ 1'
  end
end
