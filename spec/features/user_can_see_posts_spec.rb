require 'rails_helper'

RSpec.feature 'Create Post', type: :feature do
  scenario 'Signed in User can see posts on homepage' do
    sign_in
    create_post
    expect(page).to have_selector "img[src*=dog1]"
  end
end
