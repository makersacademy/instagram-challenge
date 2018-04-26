require 'net/scp'
require 'net/http'
class PostsController < ApplicationController
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

    # upload our image to remote server
    # ENV["pusher_app_id"]

    if !@post.moment.url(:medium).partition('?').first.include?("moment-default.jpg")
      # If moment url DOES NOT contains moment-default.jpg (no image is posted) else do nothing
      file_path = "#{Dir.pwd}" + "/public" + "#{@post.moment.url(:medium).partition('?').first}"
      file_name = "#{@post.moment.url(:medium).partition('?').first}"
      file_name = File.basename(file_name)
      #response = Net::HTTP.get('18.188.174.95', "#{file_name}")
      p "Our new code starts here ::::::::::::::: "

      # Partition the filename (image.jpg) into an array, ["image", ".", "jpg"]
      pre_file_name = file_name.partition('.')

      # Set URI to server_name/image_name
      uri = URI("http://18.188.174.95/#{file_name}")
      # Do a HTTP Request on this URI
      res = Net::HTTP.get_response(uri)
      # If the response from the HTTP Request = 404, continue on (if file does not exist), otherwise...
      if res.code == "200"
        # Set variables for loop
        i = 1 # File increment
        code = "1" # Set response code to arbitrary value
        until code == "404" # i.e. not found
          # Concat pre_file_name with file counter, i.e. image1
          pre_file_name[0] = pre_file_name[0] + i.to_s
          # Set URI, to server_location/concat_pre_file_name.pre_file_name_extension
          uri = URI("http://18.188.174.95/#{pre_file_name[0]}.#{pre_file_name[2]}")
          # Get response
          res = Net::HTTP.get_response(uri)
          p "at the start of our loop res =..."
          p res
          i += 1
          code = res.code
          p "we are now in the loooop"
          p "i equals:"
          p i
          p "code (http) equals:"
          p code
          p "URI Equals: "
          p uri
        end
      end

      # p @post.moment.moment_file_name = "#{pre_file_name[0]}.#{pre_file_name[2]}"

      Net::SCP.upload!("18.188.174.95", "ubuntu",
      file_path, "/var/www/html/#{pre_file_name[0]}.#{pre_file_name[2]}",
      ssh: { password: ENV["password"] })
      FileUtils.rm_rf("#{Dir.pwd}" + "/public/system/posts/")

      Net::SSH.start('18.188.174.95', 'ubuntu', password: ENV["password"]) do |ssh|
        ssh.exec "chmod 444 /var/www/html/*"
      end
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
