class TagsController < ApplicationController

  def find_posts
    if params[:tag_text] != ""
      @tag = Tag.find_by(tag_text: params[:tag_text])
      @posts = @tag ? @tag.posts : []
      render 'posts/index'
    else redirect_to posts_path
    end
  end

end
