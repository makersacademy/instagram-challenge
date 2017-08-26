require 'rails_helper'

describe 'pictures listing page' do
  it 'tells me there are no pictures' do
    visit '/pictures'
    expect(page).to have_content 'No pictures yet'
  end
end
