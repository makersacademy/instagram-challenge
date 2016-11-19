require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added'
    scenario 'should display pictures once they are added' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
end

context 'restaurants have been added' do
  before do
    Pictures.create(name: 'pic1')
  end

  scenario 'display pictures' do
    visit '/pictures'
    expect(page).to have_css("img[src*='file_name_here']")
    expect(page).not_to have_content('No pictures yet')
  end
end
