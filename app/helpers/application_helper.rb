module ApplicationHelper
  def default_avatar(user_image)
    if user_image == nil
      'avatars/default_avatar.jpeg'
    else
      user_image
    end
  end

  def format_birthday(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
