require 'rails_helper'

feature 'commenting' do

  before {Picture.create(image_file_name: 'spec/assets/images/dism.jpg')}

  scenario 'allows users to leave a comment using a form' do
    visit '/pictures'
    click_link 'Comment'
    fill_in "Thoughts", with: "Wow!"
    click_button 'Post'

    expect(current_path).to eq '/pictures'
    expect(page).to have_content('Wow!')
  end

end