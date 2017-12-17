class Userapi::ProfilesController < ApplicationController
  def index
  user = User.find(current_user.id)
  images = Image.find_by(user_id: current_user.id)
  image_id = images.id
  reactions = Reaction.where(image_id: image_id)
  likes = Like.where(image_id: image_id)
  render :json => { images: images, reactions: reactions, likes: likes, user: user }
  end
end
