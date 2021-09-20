class Post < ApplicationRecord

  def likes_count
    Like.count { |x| x[:post_id] == self.id }
  end
end
