require 'rails_helper'

feature 'commenting' do
  before { Contribution.create comment: 'A black cat' }
  scenario 'allows users to leave comments using a form' do
    visit '/contributions'
    click_link 'comment'
    fill_in 'Comment', with: 'You are lucky!'
    click_button '+'
    expect(page).to have_content 'You are lucky!'
    expect(current_path).to eq '/contributions'
  end
end
