require 'rails_helper'

RSpec.describe "Pictures", type: :feature do

  scenario 'A user can upload an image to a post' do
    sign_in(create(:user))
    visit '/pictures/'
    click_link 'Create post'
    attach_file("picture_image", Rails.root + "spec/fixtures/beach.jpg")
    click_button 'Create post'
    expect(page.find('img')['src']).to have_content('.jpg') 
  end
end