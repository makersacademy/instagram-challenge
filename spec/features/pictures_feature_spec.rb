require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added'
    scenario 'should display pictures once they are added' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
end

context 'pictures have been added' do
  before do
    Picture.create(name: 'pic1')
  end

  scenario 'display pictures' do
    visit '/pictures'
    expect(page).to have_content('pic1')
    expect(page).not_to have_content('No pictures yet')
  end
end

context 'creating pictures' do
  scenario 'prompts user to upload a new picture and displays it' do
    visit '/pictures'
    click_link 'Add a picture'
    fill_in 'Name', with: 'pic1'
    fill_in 'Comment', with: 'comment1'
    click_button 'Create Picture'
    expect(page).to have_content 'pic1'
    expect(page).to have_content 'comment1'
    expect(current_path).to eq '/pictures'
  end
end

context 'viewing pictures' do

  let!(:pic1){ Picture.create(name:'pic1') }

  scenario 'lets a user view a picture' do
   visit '/pictures'
   click_link 'pic1'
   expect(page).to have_content 'pic1'
   expect(current_path).to eq "/pictures/#{pic1.id}"
  end

end
