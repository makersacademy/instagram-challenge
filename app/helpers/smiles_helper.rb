module SmilesHelper
  def current_user_has_smiled?(photo)
    Smile.where(photo: photo, user: current_user).any?
  end

  def smile_type(photo)
    if current_user_has_smiled?(photo)
      'smile'
    else
      'indifferent'
    end
  end
end
