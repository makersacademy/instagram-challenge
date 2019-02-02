class LikesController < ApplicationController

  def new
    @like = Like.new()
    @post = Post.find(params[:post_id])
    @like.post_id = params[:post_id]
    respond_to do |format|
      if @like.save
        format.html { redirect_to @post, notice: 'Post was liked' }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

end
