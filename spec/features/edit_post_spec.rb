require 'rails_helper'

describe 'Users can edot', type: :feature do
  scenario 'their already posted description' do 
    visit '/'
    register
    click_link 'New post'
    fill_in 'Image', :with => 'https://tinyurl.com/8kx8xsyj'
    fill_in 'Description', :with => 'check out my new pan'
    click_button 'Post'


    click_link 'Edit'
    fill_in 'Description', :with => 'check out my new edited pan'
    click_button 'Edit post'

    expect(page).to have_content('check out my new edited pan')
  end 
end 