require 'rails_helper'

feature 'pages are protected before login' do
  background do
    sign_up('roman_slayer@gmail.com', 'RomanSlayer')
    add_pict('I love this pict?', 'I will keep this', 'Great' )
    add_pict('I hate this pict?', 'This is a rubbish clue', 'Stupid' )
    click_link 'To the Pict feed!'
  end

  scenario 'You cannot go onto new post if you\' not logged in' do
     click_link 'Logout'
     click_link 'New Pict'
     expect(page).to have_content 'Cannot do that without signing up...or logging in...'
     expect(page).not_to have_content ' Add a new Pict!'
  end

end
