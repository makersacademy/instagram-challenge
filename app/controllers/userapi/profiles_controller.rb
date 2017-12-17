class Userapi::ProfilesController < ApplicationController
  def index
  user = User.find(current_user.id)
  users = User.all
  images = Image.where(user_id: current_user.id)
  reactions = Reaction.all
  likes = Like.all
  render :json => { images: images, reactions: reactions, likes: likes, user: user, users: users }
  end
end
