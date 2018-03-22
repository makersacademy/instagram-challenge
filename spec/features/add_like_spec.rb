require 'rails_helper'

feature 'Adding likes' do

  scenario 'Number of likes is increasing by one' do
    sign_up
    upload_photo
    click_on('❤️')
    expect(current_path).to eq('/photos')
    expect(page.status_code).to eq(200)
    expect(page.all('.like_count')[0]).to have_content('1')
  end

  scenario 'One user cannot like the same photo twice' do
    sign_up
    upload_photo
    click_on('❤️')
    click_on('❤️')
    expect(current_path).to eq('/photos')
    expect(page.status_code).to eq(200)
    expect(page.all('.like_count')[0]).to have_content('1')
  end


  end
