feature 'Creating a post' do
  before do
    visit('/')
    click_link 'Register'
    fill_in 'Email', with: 'lewis@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

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
    expect(page).to have_content('You must select a picture to post')
  end
end
