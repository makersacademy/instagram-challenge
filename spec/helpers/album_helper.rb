def add_album(title: 'Test Title', description: 'This is the description of the test album')
  visit '/albums/new'
  fill_in 'album[title]', with: title
  fill_in 'album[description]', with: description
  click_button 'Add Album'
end
