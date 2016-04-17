class Like < ActiveRecord::Base
  belongs_to :photo

  def self.create_with_photo_id(photo_id)
    like = Like.create
    like.photo_id = photo_id
  end
end
