class PostsController < ApplicationController

def index
    @post = Post.new
    @posts = Post.all.with_attached_images

end 

    def create 

        @post = Post.new(posts_params)
        if @post.save
          redirect_to '/posts'
        else
          render '/posts'
        end 
    end 

    def edit
      @post = Post.find(params[:id])
    end
  
    def update
      @post = Post.find(params[:id])
  
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit
      end
    end
  
def index_API
  @post = Post.new
  p "iam in the index_api"
    sql = 'SELECT posts.*, users.username
    FROM posts 
    INNER JOIN users 
    ON posts.user_id = users.id'
    @posts = ActiveRecord::Base.connection.execute(sql)
json_object = {
  "posts"=> []
}
      @posts.each do |post|
      json_subnode = {
        "id": post['id'],
        "message": post['message'],
        "created_at": post['created_at'],
        "updated_at": post['updated_at'],
        "username": post['username'],
        "images": post['images']
      }
      json_object["posts"]<< json_subnode
      p 'json_object'
      p json_object
      end 
    render json: @posts
  
  end 

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
  
      redirect_to '/posts'
    end

    private
    def posts_params
      params.require(:post).permit(:description, :user_id, :post_id, :url, images: [])
    end
end
