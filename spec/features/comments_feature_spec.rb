require 'rails_helper'

feature 'commenting' do
  let(:user) { create :user }

  before do
    @image = user.images.create caption: 'Test caption'
  end

  context 'comments have been added' do
    before do
      @comment = @image.comments.build(message: 'Test comment')
      @comment.user = user
      @comment.save
    end

    scenario 'display comments' do
      visit '/images'
      expect(page).to have_content 'Test comment'
    end

    scenario 'display username of comment owner' do
      visit '/images'
      expect(page).to have_content 'testie'
    end
  end

  context 'adding comments' do
    context 'when logged in' do
      scenario 'user adds a comment, then displays the new comment' do
        sign_in(user)
        visit '/'
        fill_in "Message", with: "Test comment"
        click_button 'Leave Comment'
        expect(current_path).to eq '/images'
        expect(page).to have_content('Test comment')
      end
    end

    context 'when not logged in' do
      scenario 'prompts user to log in or sign up' do
        visit '/'
        fill_in "Message", with: "Test comment"
        click_button 'Leave Comment'
        expect(page).to have_content('You need to sign in or sign up before continuing.')
      end
    end
  end

  def sign_in(user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Login', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

end
