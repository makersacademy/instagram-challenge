class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.create(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Posted babes <3' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Sorted it 4 u hun' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Got dat deleted 4 u princess' }
      format.json { head :no_content }
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

  def post_params
    params.require(:post).permit(:comment, :avatar)
  end

end
