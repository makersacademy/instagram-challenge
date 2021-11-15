module UsersHelper
  def avatar_for(user)
    if user.avatar.attached?
      @user_avatar = image_tag(user.avatar, height:"30px", class:"rounded-circle", alt: user.first_name)
    else
      @user_avatar = image_tag("avatar_placeholder.png", height:"30px", class:"rounded-circle", alt: user.first_name)
    end
    return @user_avatar
  end
end
