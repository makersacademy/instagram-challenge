class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    p 'COMMENT'
    p @comment
    if session[:user_id] != nil
      Comment.create({user_id: session[:user_id], picture_id: @comment.picture_id, message: params[:comment]['message']})
      redirect_to "/pictures/new"
    end
  end


  # private

  # def user_params
  #   params.require(:user).permit(:username, :email, :password)
  # end
end
