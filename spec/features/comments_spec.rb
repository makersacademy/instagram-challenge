require 'rails_helper'
RSpec.feature 'comments', type: :feature do
  before(:each) do
    sign_up
    click_link 'View Posts'
    click_link 'New post'
    fill_in 'post[title]', with: 'Test'
    fill_in 'post[text]', with: 'Hello, world!'
    click_button 'Submit'
    click_link 'Show'
  end

  scenario 'you can add comments' do
    fill_in 'comment[body]', with: 'Test Comment'
    click_button 'Create Comment'
    expect(page).to have_content "Test Johnson -\nTest Comment"
  end

  scenario 'you can delete comments' do 
    fill_in 'comment[body]', with: 'Test Comment'
    click_button 'Create Comment'
    click_link 'Remove'
    expect(page).to_not have_content 'Test Comment'
  end
end