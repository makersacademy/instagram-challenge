module ApplicationHelper
  def sign_up
    visit '/'
    click_link 'Sign up'
    fill_in('Email', with: 'name@email.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button 'Sign up'
  end

  def sign_up_2
    visit '/'
    click_link 'Sign up'
    fill_in('Email', with: 'test@mail.com')
    fill_in('Password', with: '123456')
    fill_in('Password confirmation', with: '123456')
    click_button 'Sign up'
  end

  def create_post
    visit '/'
    click_link 'Add an image'
    fill_in('Title', with: 'Sunny Day')
    fill_in('Description', with: 'At the park')
    click_button 'Post Image'
  end

end
