require 'rails_helper'

feature 'pictures' do
  context 'on the first visit ' do
    scenario 'there should be content....' do
    visit('/pictures')
    expect(page).to have_content('No pictures on here yet')
    expect(page).to have_link('Add a photo!')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
    end
  end
end
