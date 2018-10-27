# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :find_post!

  # GET /comments
  # GET /comments.json
  def index
    @comments = @post.comments.order(created_at: :desc)
 end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    # @comment = @post.comments.new(comment_params.merge(user_id: current_user.id, post_id: post_id))
    # @comment.user = current_user
    # redirect_to welcome_index_url
    # render json: { errors: @comment.errors }, status: :unprocessable_entity unless @comment.save
    post_id = params[:post_id]
    @post = Post.find(post_id)
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id, post_id: post_id))
    redirect_to welcome_index_url
  end
  # respond_to do |format|
  #   if @comment.save
  #     format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
  #     format.json { render :show, status: :created, location: @comment }
  #   else
  #     format.html { render :new }
  #     format.json { render json: @comment.errors, status: :unprocessable_entity }
  #   end
  # end
  # end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  # def update
  #   respond_to do |format|
  #     if @comment.update(comment_params)
  #       format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @comment }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /comments/1
  # DELETE /comments/1.json
  # def destroy
  #   @comment.destroy
  #   respond_to do |format|
  #     format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def find_post!
    post_id = params[:post_id]
    @post = Post.find(post_id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
