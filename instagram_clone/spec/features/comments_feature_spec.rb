require 'rails_helper'
require 'web_helper'

feature 'commenting' do
  before do
    sign_up
    create_contribution
  end

  scenario 'allows users to leave comments using a form' do
    visit '/contributions'
    click_link 'comment'
    fill_in 'Comment', with: 'You are lucky!'
    click_button '+'
    expect(page).to have_content 'You are lucky!'
    expect(current_path).to eq '/contributions'
  end
end
