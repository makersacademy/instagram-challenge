require 'rails_helper'

describe 'Home' do
  context 'on the home page' do
    scenario 'visitor sees homepage' do
      visit '/'
      expect(page).to have_content 'Instakilo - like Instagram, just a thousand times better'
    end
  end
end