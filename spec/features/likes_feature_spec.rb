require 'rails_helper'
require_relative '../helpers/helper_methods.rb'


feature 'liking a picture' do
  before do
    sign_in 
    add_picture
  end

  scenario 'a user can endorse a review, which updates the review endorsement count' do
    visit '/pictures'
    click_link 'Like'
    expect(page).to have_content('1 Like')
  end

end