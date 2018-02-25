feature 'edit and destroy picts' do
  background do
    sign_up('roman_slayer@gmail.com', 'RomanSlayer')
    add_pict('I love this pict?', 'I will keep this', 'Great' )
    add_pict('I hate this pict?', 'This is a rubbish clue', 'Stupid' )
    click_link 'To the Pict feed!'
  end

  scenario 'edit the hint and title of a pict' do
    page.all(:link, 'Edit Pict')[1].click
    fill_in :Hint, with: 'This is a better clue'
    fill_in :Title, with: 'I like it now?'
    click_button 'Change Pict'
    expect(page).to have_content 'Successfully changed Pict'
    expect(page).to have_content 'This is a better clue'
    expect(page).to have_content  'I like it now?'
    expect(page).not_to have_content 'I hate this pict?'
    expect(page).not_to have_content 'This is a rubbish clue'
  end


  scenario 'destroy a bad pict' do
    page.all(:link, 'Destroy Pict')[1].click
    expect(page).to have_content 'I love this pict?'
    expect(page).to have_content 'Pict Destroyed'
    expect(page).not_to have_content 'I hate this pict?'
  end


  scenario 'get told you cannot change a picts title to remove the ?' do
    page.all(:link, 'Edit Pict')[1].click
    fill_in :Title, with: 'I like it now'
    click_button 'Change Pict'
    expect(page).to have_content "Errors, see below"
    expect(page).to have_content "Title needs a question mark at the end"
    expect(page).not_to have_content 'Successfully changed Pict'
  end
end
