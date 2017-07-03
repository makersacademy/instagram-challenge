class UsersController < Clearance::UsersController

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_to posts_url
    else
      render template: 'users/new'
    end
  end
  
  private

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
    end
  end  
    
end
