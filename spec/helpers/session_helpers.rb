module Session

  def sign_up(email, password)
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    fill_in('Password confirmation', with: password)
    click_button('Sign up')
  end

  def leave_review(thoughts, rating)
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

  def sign_in(email, password)
    visit('/')
    click_link('Sign in')
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_button('Log in')
  end
end