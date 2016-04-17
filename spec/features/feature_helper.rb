DEFAULT_TITLE = 'best image on the site'
DEFAULT_TITLE_2 = '2nd best image on the site'
DEFAULT_MAIL = 'lo@renzo.com'
DEFAULT_PASSWORD = 'lolsrenzo'


def helper_sign_up email: DEFAULT_MAIL, password: DEFAULT_PASSWORD
  visit new_user_registration_path
  fill_in :user_email, with: email
  fill_in :user_password, with: password
  fill_in :user_password_confirmation, with: password
  click_button 'Sign Up'
end

def helper_sign_in email: DEFAULT_MAIL, password: DEFAULT_PASSWORD
  visit new_user_session_path
  fill_in :user_email, with: email
  fill_in :user_password, with: password
  click_button 'Log in'
end


def helper_add_image title: DEFAULT_TITLE
  visit images_path
  click_link 'Add new image'
  fill_in :image_title, with: title
  click_button 'Upload your image!'
end
