feature 'edit and destroy picts' do
  scenario 'destroy a bad pict' do
    add_pict('I love this pict?', 'I will keep this', 'Great' )
    add_pict('I hate this pict?', 'This is a rubbish clue', 'Stupid' )
    click_link 'To the Pict feed!'
    page.all(:link, 'Destroy Pict')[1].click
    expect(page).to have_content 'I love this pict?'
    expect(page).to have_content 'Pict Destroyed'
    expect(page).not_to have_content 'I hate this pict?'
  end
end
