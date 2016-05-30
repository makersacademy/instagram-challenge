def my_sign_up(params = {
	 user_name: "test",
   email: "test@example.com",
   password: "testtest",
   password_confirmation: "testtest"})
   visit('/')
   click_link('Sign up')
   fill_in('Email', with: params[:email])
   fill_in('Password', with: params[:password])
   fill_in('Password confirmation', with: params[:password_confirmation])
   click_button('Sign up')
end 