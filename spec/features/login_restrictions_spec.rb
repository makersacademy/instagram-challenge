require 'rails_helper'

feature 'pages are protected before login' do
  background do
    sign_up('roman_slayer@gmail.com', 'RomanSlayer')
    add_pict('I love this pict?', 'I will keep this', 'Great')
    add_pict('I hate this pict?', 'This is a rubbish clue', 'Stupid')
  end

  scenario 'You cannot go onto new post if you\'re not logged in' do
    click_link 'Logout'
    click_link 'New Pict'
    expect(page).to have_content 'Cannot do that without signing up...or logging in...'
    expect(page).not_to have_content ' Add a new Pict!'
  end

  scenario 'You cannot go onto edit a post if you\'re not logged in' do
    click_link 'Logout'
    page.all(:link, 'Edit Pict')[1].click
    expect(page).to have_content 'Cannot do that without signing up...or logging in...'
    expect(page).not_to have_content 'Hint'
    expect(page).not_to have_content 'Change Pict'
  end

  scenario 'You cannot destroy a post if you\'re not logged in' do
    click_link 'Logout'
    page.all(:link, 'Destroy Pict')[1].click
    expect(page).to have_content 'Cannot do that without signing up...or logging in...'
    expect(page).not_to have_content 'Change Pict'
  end

  # scenario 'You cannot have a got at a pict if you\'re not logged in' do
  #    click_link 'Logout'
  #    page.all(:link, 'Have a go')[1].click
  #    expect(page).to have_content 'Cannot do that without signing up...or logging in...'
  #    expect(page).not_to have_content 'I hate this pict?'
  #    expect(page).not_to have_content 'This is a rubbish clue'
  #    expect(page).not_to have_content 'Stupid'
  # end

end
