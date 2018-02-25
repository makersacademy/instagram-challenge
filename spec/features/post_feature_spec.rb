feature 'Creating a post' do
  scenario 'User can create a post' do
    visit ('/')
    click_link 'New Post'
    attach_file('Image', "spec/files/images/picture.jpg")
    fill_in 'Description', with: '#MyImage'
    click_button 'Create Post'
    expect(page).to have_content('#MyImage')
    expect(page).to have_css ("img[src*='picture.jpg']")
  end

  it 'cant create post without an image' do
    visit('/')
    click_link 'New Post'
    fill_in 'Description', with: 'An Image'
    click_button 'Create Post'
    expect(page).not_to have_content('An Image')
  end
end
