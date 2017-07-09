class UsersController < Clearance::UsersController

  def show
    @user = User.find(params[:id])
    @userposts = Post.where(user_id: @user.id)
  end


  def user_from_params

    email = user_params.delete(:email)
    password = user_params.delete(:password)
    username = user_params.delete(:username)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.username = username
    end
  end

end
