require 'rails_helper'

feature 'Openning the welcome#index page' do

  before(:each) do
    visit('/')
  end

  scenario 'it has a welcome message' do
    expect(page).to have_content('Welcome to instagram')
  end

  scenario 'it have a button to the post pages' do
    expect(page).to have_button(value: "See everyone's pictures")
  end

  scenario 'it is connected to the post page' do
    click_button(value: "See everyone's pictures")
    expect(page).to have_content('See all the post')
  end

end
