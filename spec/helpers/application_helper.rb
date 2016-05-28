module ApplicationHelper
  def sign_up email: '123@abc.com', password: '12345678', confirmation: '12345678'
    visit posts_path
    click_link 'Sign up'
    fill_in :Email, with: email
    fill_in :Password, with: password
    fill_in :'Password confirmation', with: confirmation
    click_button 'Sign up'
  end
end
