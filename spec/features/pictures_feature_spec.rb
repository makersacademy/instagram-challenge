require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet!'
      expect(page).to have_link 'Click here to add a picture!'
    end
  end

  context 'uploading a picture' do
    scenario 'succeeds when a title is entered' do
      upload_picture
      expect(page).to have_css("img[src*='Pompey.jpg']")
    end

    scenario 'fails without a title' do
    visit '/pictures'
    click_link 'Click here to add a picture!'
    attach_file "Image", 'spec/features/Pompey.jpg'
    click_button 'Upload picture'
    expect(page).to have_content 'error'
    end
  
  end

  context 'viewing a picture' do
    let!(:pfc) {Picture.create(title:'PFC',
                             image: File.new("spec/features/Pompey.jpg") )}
    scenario 'allows a picture to be viewed by clicking on the title' do
      visit '/pictures'
      click_link 'PFC'
      expect(page).to have_content 'PFC'
      expect(current_path).to eq "/pictures/#{pfc.id}"
    end

  end



  def upload_picture
  visit '/pictures'
  click_link 'Click here to add a picture!'
  fill_in 'Title', with: 'PFC'
  attach_file "Image", 'spec/features/Pompey.jpg'
  click_button 'Upload picture'
  end

end
