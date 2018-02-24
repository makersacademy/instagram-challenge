require 'rails_helper'

feature 'add a pict' do
  scenario 'add a cool pict' do
    visit '/'
    click_link 'New Pict'
    fill_in :hints, with: 'We do it all the time'
    fill_in :answer, with: 'TDD'
    attach_file('pict[image]', 'spec/docs/images/code_clue.jpg')
    click_button 'Add Pict'
    expect(page).to have_content 'We do it all the time'
    expect(page).to have_content 'Successfully added Pict'
    expect(page).to have_css('img[src*="code_clue.jpg"]')
  end
end
