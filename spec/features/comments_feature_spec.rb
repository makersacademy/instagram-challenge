require 'rails_helper'

feature 'comments' do
  before do
    @user = create(:user)
    @user.pictures.create(caption: 'Amazing friggin caption')
    @user2 = User.create email: 'katsuraku@gmail.com', password: 'kjkjkjkj', password_confirmation: 'kjkjkjkj', username: 'kjones'
  end

  scenario 'a signed in user can leave a comment on a picture using a form' do
    login_as @user
    post_comment

    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'Amazing friggin comment'
  end

  scenario 'comments are displayed alongside the username of the poster' do
    login_as @user2
    post_comment

    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'kjones'
  end

  scenario 'comments can be deleted by the user who wrote them' do
    login_as @user
    post_comment
    click_link 'Delete comment'

    expect(page).not_to have_content('Amazing friggin comment')
  end

  scenario 'comments cannot be deleted by a user who did not write them' do
    login_as @user
    post_comment
    click_link 'Sign out'
    login_as @user2
    click_link 'Delete comment'

    expect(page).to have_content('Amazing friggin comment')
    expect(page).to have_content('You can only delete comments which you wrote ')
  end

  def post_comment
    visit '/pictures'
    click_link 'Comment'
    fill_in 'comment_my_comment', with: 'Amazing friggin comment'
    click_button 'Post Comment'
  end
end
