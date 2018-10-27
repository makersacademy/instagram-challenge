class PostsController < ApplicationController
  include ApplicationHelper
  # before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_path

    if !@post.moment.url(:medium).partition('?').first.include?("moment-default.jpg")
      # If moment url DOES NOT contains moment-default.jpg (no image is posted) else do nothing
      local_filepath = "#{Dir.pwd}" + "/public" + "#{@post.moment.url(:medium).partition('?').first}"
      file_name = "#{@post.moment.url(:medium).partition('?').first}"
      file_name = File.basename(file_name)
      # Partition the filename (image.jpg) into an array, ["image", ".", "jpg"]
      pre_file_name = file_name.partition('.')
      new_filename = get_unique_remote_filename("posts", pre_file_name[0], pre_file_name[2])

      # Now we need to edit the Posts table directly,
      # to update the new filename (after checking if
      # the users filename is in use)
      # (Posts table) = connect-to-the-database(Update Posts Table, Set moment_file_name column to the new filename, based on post id)
      @posts = ActiveRecord::Base.connection.execute("UPDATE posts SET moment_file_name = '#{new_filename}' WHERE id='#{@post.id}'")

      #remote_filepath = "#{pre_file_name[0]}.#{pre_file_name[2]}"
      initiate_scp(local_filepath, new_filename, "posts")
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:success] = "Post Deleted"
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(caption: params[:caption])
    redirect_to posts_path
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:moment, :caption)
  end
end
