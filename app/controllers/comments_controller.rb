class CommentsController < ApplicationController
  before_action :require_login

  def index
  end

  def create
    render plain: params[:article].inspect
  end

  def show
  end

  private

  def comment_params
  end
end
