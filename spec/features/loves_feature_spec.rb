require 'rails_helper'

feature 'loves' do

  before { Image.create description: 'First picture', avatar_file_name: 'test.jpg' }

  scenario 'allow users to "love" images' do
    visit '/images'
    click_button 'Love'
    expect(current_path).to eq '/images'
    expect(page).to have content 'Loves: 1'
  end
end
