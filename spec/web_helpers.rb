def create_account (user_details)
  visit('/')
  click_link('Sign up')

  user_details.each do |detail|
    fill_in(detail[0], with: detail[1])
  end

  click_button('Sign up')
end
