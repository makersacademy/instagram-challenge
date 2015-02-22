require 'rails_helper'
require_relative '../helpers/helper_methods.rb'


feature 'liking a picture' do

  before do
    sign_in
    add_picture
  end
 
  it 'a user can like a picture, which increments the like count', js: true do
    visit '/pictures'
    click_link 'Like'
    save_and_open_page
    expect(page).to have_content("1 like")
  end

end