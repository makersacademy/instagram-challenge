module LikesHelper
  def hearts(likes)
    if likes == 0
      '0 ♡'
    else
      likes.to_s + ' ♥'
    end
  end
end
