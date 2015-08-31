require 'rails_helper'

feature 'commenting' do
  before do
    @user = create(:user)
    @user.pictures.create(caption: 'Amazing friggin caption')
  end

  scenario 'allows users to leave a comment on a picture using a form' do
    post_comment
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'Amazing friggin comment'
  end

  context 'deleting comments' do
    before do
      login_as @user
      @user2 = User.create email: 'katsuraku@gmail.com', password: 'kjkjkjkj', password_confirmation: 'kjkjkjkj'
    end

    scenario 'comments can be deleted by the user who wrote them' do
      post_comment
      click_link 'Delete comment'

      expect(page).not_to have_content('Amazing friggin comment')
    end

    scenario 'comments cannot be deleted by a user who did not write them' do
      post_comment
      click_link 'Sign out'
      login_as @user2
      click_link 'Delete comment'

      expect(page).to have_content('Amazing friggin comment')
      expect(page).to have_content('You can only delete comments which you wrote ')
    end
  end

  def post_comment
    visit '/pictures'
    click_link 'Comment'
    fill_in 'comment_my_comment', with: 'Amazing friggin comment'
    click_button 'Post Comment'
  end
end
