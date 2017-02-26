require 'rails_helper'
feature 'articles' do
  scenario 'is the home page' do
    visit '/'
    expect(page).to have_content 'Instagram'
  end
end
