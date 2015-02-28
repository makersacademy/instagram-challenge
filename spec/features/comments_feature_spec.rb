feature 'comments' do
  before { Post.create description: 'Awesome latte' }

  scenario 'allows user to leave a comment' do
    sign_up('test@test.com', 'testtest', 'testtest')
    write_comment('Great picture')
    expect(page).to have_content 'Great picture'
    expect(current_path).to eq '/posts'
  end

  scenario 'prevents a user leaving a comment if they are not signed in' do
    visit '/'
    click_link 'Write a comment'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'an invalid comment' do
    sign_up('test@test.com', 'testtest', 'testtest')
    write_comment('XY')
    expect(page).not_to have_css 'li', text: 'XY'
    expect(page).to have_content 'error'
  end

end