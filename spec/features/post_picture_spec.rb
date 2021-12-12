require 'rails_helper'

RSpec.describe "Pictures", type: :feature do
  scenario 'A user can upload an image to a post' do
    pending
    visit '/pictures/'
    click_link 'Create post'
    attach_file("Select image", Rails.root + "spec/fixtures/beach.jpg")
    click_button 'Submit post'
    expect(page.find('.image')['src']).to have_content('beach.png') 
  end
end