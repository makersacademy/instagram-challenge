module AuthHelpers
  def sign_in(user)
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
end

RSpec.configure do |config|
  config.include AuthHelpers, type: :feature
end
