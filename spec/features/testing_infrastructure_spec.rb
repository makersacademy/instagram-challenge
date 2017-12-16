require 'rails_helper'

feature 'testing infrastructure' do
  scenario 'testing infrastructure is working' do
    visit '/'
    expect(page).to have_content("Yay! You’re on Rails!")
  end
end
