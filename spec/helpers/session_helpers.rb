module Session

  def sign_up(email, password)
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    fill_in('Password confirmation', with: password)
    click_button('Sign up')
  end

  def leave_comment(words)
    visit '/photos'
    click_link 'Comment on Mount Fuji'
    fill_in 'Comment:', with: words
    click_button 'Leave comment'
  end
end
