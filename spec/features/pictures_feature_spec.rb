require 'rails_helper'

feature 'pictures' do
  context 'no images have been added' do
    scenario 'should display link to add a picture' do
    visit '/pictures'
    expect(page).to have_content 'No pictures added yet'
    expect(page).to have_link 'Add a picture'
    end
  end

  context 'show pictures' do
    before do
      Picture.create(status: 'Broccoli is my favourite!')
    end
    scenario 'show pictures' do
    visit '/pictures'
    expect(page).to have_content 'Broccoli is my favourite!'
    expect(page).not_to have_content 'No pictures added yet'
    end
  end
end
