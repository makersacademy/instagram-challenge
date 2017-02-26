require 'rails_helper'

xfeature 'sign up' do
  scenario 'user should be able to sign up' do
    visit '/photos'
    click_button 'sign_up'
    expect(page.current_path).to eq 'users/new'
  end
end
