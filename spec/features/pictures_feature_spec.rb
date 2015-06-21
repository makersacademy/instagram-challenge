require 'rails_helper'



feature 'pictures' do

  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end


  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_button 'Upload a picture'
    end
  end
  xscenario 'add a Picture' do
    visit('/')
    click_button('Upload a picture')
    attach_file('Image', File.join(Rails.root, 'spec', 'features/uploads', 'dover.jpg'))
    fill_in 'Title', with: 'At the sea'
    click_button('Upload')
    expect(current_path).to eq ('/')
    expect(page).to have_content('At the sea ')
    expect(page).to have_css('.img-post')
  end

  xscenario 'display pictures' do
    visit '/pictures'
    expect(page).to have_content('At the sea')
    expect(page).not_to have_content('No pictures yet')
  end
  context 'deleting pictures' do

  before {Picture.create title: 'at the sea'}

  scenario 'removes a picture when a user clicks a delete link' do
    visit '/pictures'
    click_link 'Delete picture'
    expect(page).not_to have_content 'at the sea'
    expect(page).to have_content 'Picture deleted successfully'
  end

end
end