feature 'Posting' do

  scenario 'Posts can be created' do
    visit '/posts'
    create_post
    expect(page).to have_content 'Post was successfully created.'
  end

  scenario 'Posts can be liked' do
    visit '/posts'
    create_post
    visit '/posts'
    click_on 'Like'
    expect(page).to have_content '1 Like'
  end
end
