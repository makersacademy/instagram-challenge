# frozen_string_literal: true

require 'pry'

module ApplicationHelper
  class Likeable < Module
    """
    accessible to all Models by inserting adding
    reference to likes in Model
    > has_many :likes, as: :likeable
    then include the helper in the controller
    > include ApplicationHelper::Likeable.new <Class>
    """

    def initialize(likeable_class)
      @likeable_class = likeable_class
    end

    def included(base)
      likeable_class = @likeable_class
      base.class_eval do
        define_method(:like) do
          @likeable = likeable_class.find(params[:id])
          like = Like.find_by(likeable: @likeable, user: current_user)
          if like
            like.destroy
            flash = "Like Removed!"
          else
            Like.create(likeable: likeable_class.find(params[:id]), user: current_user)
            flash = "Like Counted!"
          end
          respond_to do |format|
            format.html do
              flash[:notice] = flash
              redirect_to posts_url
            end
            format.js { render file: "/app/views/likes/like.js.erb" }
          end
        end
      end
    end
  end

  class Commentable < Module
    """
    accessible to all Models by inserting adding
    reference to comments in Model
    > has_many :comments, as: :commentable
    then include the helper in the controller
    > include ApplicationHelper::Commentable.new <Class>
    """

    def initialize(commentable_class)
      @commentable_class = commentable_class
    end

    def included(base)
      commentable_class = @commentable_class
      base.class_eval do
        define_method(:comment) do
          @commentable = commentable_class.find(params[:id])
          comment_params = params.require(commentable_class.name.downcase).require(:comment).permit(:message).merge(user: current_user).merge(commentable: @commentable)
          @comment = Comment.create(comment_params)
          flash = "Comment Added!"
          respond_to do |format|
            format.html do
              flash[:notice] = flash
              redirect_to posts_url
            end
            format.js { render file: "/app/views/comments/comment.js.erb" }
          end
        end
      end
    end
  end
end
