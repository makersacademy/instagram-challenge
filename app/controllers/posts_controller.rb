class PostsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @project.posts.create(review_params)
    redirect_to projects_path
  end
  def new
    @project = Project.find(params[:project_id])
    @post = Post.new
  end

private

  def review_params
    params.require(:post).permit(:description, :image)
  end
end
