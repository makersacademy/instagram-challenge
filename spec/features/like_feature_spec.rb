feature 'Likes' do

  before do
    # sign_up
    # post_a_picture
  end

  scenario 'a user can like a picture, which updates the likes count', js: true do
    sign_up
    post_a_picture
    visit '/pictures'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  scenario 'a user can only like a picture once', js: true do
    sign_up
    post_a_picture
    visit '/pictures'
    click_link 'Like'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end
