require 'rails_helper'
require 'web_helper'

feature 'commenting' do
  before do
    sign_up
    create_contribution
    sign_out
  end

  scenario 'allows users to leave comments using a form' do
    sign_up_2
    visit '/contributions'
    click_link 'comment'
    fill_in 'Comment', with: 'You are lucky!'
    click_button '+'
    expect(page).to have_content 'ANOTHER'
    expect(page).to have_content 'You are lucky!'
    expect(current_path).to eq '/contributions'
  end
end
