require 'rails_helper'

describe 'submitting a new post', type: :feature do
  scenario 'share a new pan' do 
    visit '/'
    register
    click_link 'New post'
    attach_file('image[image]', File.absolute_path('./spec/features/spec_images/wok.jpg'))
    fill_in 'Caption', :with => 'check out my new pan'
    click_button 'Post'
    expect(page).to have_content('check out my new pan')
  end 
end 