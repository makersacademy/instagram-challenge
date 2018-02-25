require 'rails_helper'

feature 'add a pict' do
  scenario 'add a cool pict' do
    add_pict('What could this be?', 'We do it all the time', 'TDD' )
    expect(page).to have_content 'We do it all the time'
    expect(page).to have_content 'Successfully added Pict'
    expect(page).to have_content 'What could this be?'
    expect(page).to have_css('img[src*="code_clue.jpg"]')
  end

  scenario 'try add a pict with no title or image... and fail' do
    visit '/'
    click_link 'New Pict'
    click_button 'Add Pict'
    expect(page).to have_content "Errors, see below"
    expect(page).to have_content "You need to add an image"
    expect(page).to have_content 'You need a title! (Don\'t forget a question mark)'
    expect(page).not_to have_content 'Successfully added Pict'
  end

  scenario 'add an image, but don\'t put a question mark on the title' do
      add_pict('What could this be', 'We do it all the time', 'TDD' )
    expect(page).to have_content "Errors, see below"
    expect(page).to have_content "Title needs a question mark at the end"
    expect(page).not_to have_content 'Successfully added Pict'
  end
end
