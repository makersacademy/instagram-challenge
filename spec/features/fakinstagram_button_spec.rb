require 'rails_helper'
include HomeHelper

RSpec.feature 'user can update a post' do
  scenario 'and you can see it on the feed' do
    sign_up
    click_link('FakInstagram')
    expect(current_path).to eq('/home/index')
    expect(page).to have_content('Welcome, username!')
  end
end
