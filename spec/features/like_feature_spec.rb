feature 'Likes' do

  before do
    sign_up
    post_a_picture
  end

  scenario 'a user can like a picture, which updates the likes count' do
    visit '/pictures'
    click_link 'Like'
    expect(Like.count).to eq 1
    expect(page).to have_content('1 like')
  end

  scenario 'a user can only like a picture once' do
    visit '/pictures'
    click_link 'Like'
    expect{ click_link 'Like' }.not_to change{ Like.count }
    expect(page).to have_content('Sorry, you can only like a picture once')
  end

end
