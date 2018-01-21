feature 'Posts' do

  scenario 'can be created' do
    sign_up
    create_post
    expect(page).to have_content 'Post was successfully created.'
  end

  scenario 'can be liked' do
    sign_up
    create_post
    click_on 'Like'
    expect(page).to have_content '1 Like'
  end

  scenario 'can be commented on' do
    sign_up
    create_post
    fill_in :comment_content, with: 'Test Comment'
    click_on 'Comment'
    expect(page).to have_content 'Test Comment'
  end

  scenario '- multiple can be posted/displayed' do
    sign_up
    3.times { create_post }
    expect(page).to have_selector('td', count: 3)
  end

end
