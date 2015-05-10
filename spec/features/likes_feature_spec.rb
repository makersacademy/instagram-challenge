require 'rails_helper'

feature 'liking pictures' do
  before { Picture.create name: 'photo' }
  before do
    signing_up_and_in
  end

  scenario 'allows users to click likes pictures' do
    visit '/pictures'
    click_link 'like this'
    expect(page).to have_content '1 like'
    expect(current_path).to eq '/pictures'
  end
end
