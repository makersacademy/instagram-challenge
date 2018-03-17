class PostsController < ApplicationController

def index
  @post = Post.all
end

def show
  @post = Post.find(params[:id])
  # each of the images will be unique so you need a .find method
  # for it to display it needs to grab the ID of the post.
end

def new
  @post = Post.new
end

def create
  @post = Post.new(post_params)
  if @post.save
    redirect_to @post # @post being the homepage
  else
    render 'new' # if it doesnt save (aka if the formats are incorrect or something else wrong with database etc then it redirects to the same page so they can resubmit the form again as it will go to the new method (Post.new))
    # 'render' used rather than redirect because redirect causes the server to issue another request, meanwhile render does it in the same request
  end
end

private

  def post_params
    params.require(:post).permit(:title, :image)
    # specify controller (in this case post) taking care of the params,
    # if anyone tries to submit something other than what we specify in the controller, it will not allow it
    # tl;dr we only want to allow the submission of titles and images.
    # Making it private means that it can only be accessed within the Post controller class, cannot be called from anywhere else.
    # more secure by being a private method
  end

end


