require 'rails_helper'

describe 'Users can edot', type: :feature do
  scenario 'their already posted description' do 
    visit '/'
    register
    click_link 'New post'
    attach_file('image[image]', File.absolute_path('./spec/features/spec_images/wok.jpg'))
    fill_in 'Caption', :with => 'check out my new pan'
    click_button 'Post'


    click_link 'Edit'
    fill_in 'Caption', :with => 'check out my new wok*'
    click_button 'Post'

    expect(page).to have_content('check out my new wok*')
  end 
end 