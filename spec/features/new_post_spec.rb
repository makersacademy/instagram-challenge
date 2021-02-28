require 'rails_helper'

describe 'submitting a new post', type: :feature do
  scenario 'share a new pan' do 
    visit '/'
    click_link('+')
    fill_in 'Image', :with => 'https://tinyurl.com/8kx8xsyj'
    fill_in 'Description', :with => 'check out my new pan'
    click_button('Post')
    expect(page).to have_content('check out my new pan')
  end 
end 