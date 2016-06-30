module ApplicationHelper
  def create_post(caption: 'looks like paradise!')
    visit '/posts'
    click_link 'New Post'
    attach_file('Image',"spec/files/images/maldives.jpeg")
    fill_in('Caption', with: 'caption')
    click_button 'Create Post'
  end


  def sign_up_test(email: 'test1@hotmail.com', user_name: 'test1' )
    visit('/users/sign_up')
    fill_in('Email', with: email)
    fill_in('User name', with: user_name)
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button('Sign up')
  end

  def log_in(email: "test1@hotmail.com", password: "password" )
    visit('/users/sign_in')
    fill_in('Email', with: params[:email])
    fill_in('Password', with: params[:password])
    click_button('Log in')
  end
end