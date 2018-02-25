require 'rails_helper'

feature 'add a pict' do
  background do
    visit '/'
    click_link 'New Pict'
    fill_in :Hints, with: 'We do it all the time'
    fill_in :Answer, with: 'TDD'
    fill_in :Title, with: 'What could this be?'
  end

  scenario 'add a cool pict' do
    attach_file('pict[image]', 'spec/docs/images/code_clue.jpg')
    click_button 'Add Pict'
    expect(page).to have_content 'We do it all the time'
    expect(page).to have_content 'Successfully added Pict'
    expect(page).to have_content 'What could this be?'
    expect(page).to have_css('img[src*="code_clue.jpg"]')
  end

  scenario 'try and no pict...fails' do
    click_button 'Add Pict'
    expect(page).to have_content 'Error, you need to add an image'
    expect(page).not_to have_content 'Successfully added Pict'
  end
end
