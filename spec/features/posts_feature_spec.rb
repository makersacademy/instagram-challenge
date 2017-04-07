feature 'Posts' do
  context 'Users can post to Instagram' do

  scenario 'Users can post pictures to Instagram' do
    visit '/'
    click_link 'New Post'
    fill_in 'post_picture', with: 'http://photodoto.com/wp-content/uploads/2014/09/1-instagram-tips-for-photography-business.jpg'
    click_button 'Create Post'
    expect(page).to have_content 'Post was successfully created.'
    expect(page).to have_content 'http://photodoto.com/wp-content/uploads/2014/09/1-instagram-tips-for-photography-business.jpg'
  end

  scenario 'Users can post captions with their pictures to Instagram' do
    visit '/'
    click_link 'New Post'
    fill_in 'post_picture', with: 'http://photodoto.com/wp-content/uploads/2014/09/1-instagram-tips-for-photography-business.jpg'
    fill_in 'post_caption', with: 'A lovely photo from my holiday'
    click_button 'Create Post'
    expect(page).to have_content 'Post was successfully created.'
    expect(page).to have_content 'A lovely photo from my holiday'
  end
end
end
