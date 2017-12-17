class Api::ImagesController < ApplicationController
  def index
    images = Image.all
    reactions = Reaction.all
    likes = Like.all
    users = User.all
    render :json => { images: images, reactions: reactions, likes: likes, users: users }
  end
end
