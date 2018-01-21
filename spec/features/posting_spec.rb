feature 'Posting' do

  scenario 'Posts can be created' do
    visit '/posts'
    create_post
    expect(page).to have_content 'Post was successfully created.'
  end

  scenario 'Posts can be liked' do
    visit '/posts'
    create_post
    click_on 'Like'
    expect(page).to have_content '1 Like'
  end

  scenario 'Posts can be commented on' do
    visit 'posts'
    create_post
    fill_in :comment_content, with: 'Test Comment'
    click_on 'Comment'
    expect(page).to have_content 'Test Comment'
  end

end
