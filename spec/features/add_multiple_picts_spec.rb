require 'rails_helper'

feature 'add many picts' do
  background do
    sign_up('roman_slayer@gmail.com', 'RomanSlayer')
    add_pict('What could this be?', 'We do it all the time', 'TDD' )
    click_link 'Logout'
    sign_up('centurian@grmail.com', 'PictDestroyer')
    add_pict('What will this be?', 'Its very important...', 'TDD' )
    click_link 'To the Pict feed!'
  end

  scenario 'add multiple picts, and see on main feed' do
    expect(page).to have_content 'What could this be?'
    expect(page).to have_content 'What will this be?'
    expect(page).not_to have_content 'We do it all the time'
    expect(page).to have_css('img[src*="code_clue.jpg"]')
  end

  scenario 'checkout one pict from feed' do
    page.all(:link, 'Have a go')[1].click
    expect(page).to have_content 'What will this be?'
    expect(page).to have_content 'Its very important...'
    expect(page).not_to have_content 'TDD'
    expect(page).not_to have_content 'Who could this be?'
  end

  scenario 'expect to see the username of the maker' do
    expect(page).to have_content 'RomanSlayer'
    expect(page).to have_content 'PictDestroyer'
  end
end
