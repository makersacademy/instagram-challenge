require 'rails_helper'


feature 'commenting' do

  scenario 'allows the user to leave a comment using a form' do
    visit '/pictures'
    visit '/pictures'
    click_link('Add a picture')
    page.attach_file 'picture[image]', 'spec/assets/images/respect.jpg'
    fill_in 'Name', with: 'respect!'
    click_button 'Create Picture'
    click_link 'Comment'
    fill_in 'Thoughts', with: 'cool pic'
    click_button 'Leave Comment'

    expect(current_path).to eq '/pictures'
    expect(page).to have_content('cool pic')
  end

end
