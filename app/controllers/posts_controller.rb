class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @tags = Tag.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    if @post.save
      @tags = tag_params[:tag_text].to_s.scan(/(?<=#)\w+/)
      @tags.each do |each_tag|
        @post.tags.first_or_create(tag_text: each_tag)
      end
      redirect_to posts_path
    else render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/profile'
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      flash[:notice] = 'Post updated successfully'
      redirect_to '/profile'
  end

private

def post_params
  params.require(:post).permit(:caption, :image)
end

def tag_params
  params.require(:tag).permit(:tag_text)
end

def find_tags(caption)
  return caption.scan(/(?<=#)\w+/)
end


end
