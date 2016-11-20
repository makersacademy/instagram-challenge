require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'No images yet!'
      expect(page).to have_link 'Add an image'
    end
  end
end

context 'adding images' do
  scenario 'prompts user to fill out a form, then displays the new image' do
    visit '/images'
    click_link 'Add an image'
    fill_in 'Url', with: 'https://s-media-cache-ak0.pinimg.com/564x/0a/c5/bd/0ac5bd36c10d334d2b985893285caf14.jpg', visible: false
    click_button 'Create Image'
    expect(page).to have_content 'https://s-media-cache-ak0.pinimg.com/564x/0a/c5/bd/0ac5bd36c10d334d2b985893285caf14.jpg'
    expect(current_path).to eq '/images'
  end
end

context 'viewing images' do

  let!(:hello){ Image.create(url:'hello') }

  scenario 'lets a user view an image' do
   visit '/images'
   click_link 'hello'
   expect(page).to have_content 'hello'
   expect(current_path).to eq "/images/#{hello.id}"
  end

end
