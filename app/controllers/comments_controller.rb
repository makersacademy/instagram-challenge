# frozen_string_literal: true

# Controller for the comments
class CommentsController < ApplicationController
  before_action :find_gram
  include CommentsHelper

  def create
    @gram.comments.create(user_id: current_user.id,
                          content: params[:comment].values.join(''))
    redirect_to gram_url(@gram)
  end

  def show; end

  private

  def find_gram
    @gram = Gram.find(params[:gram_id])
  end
end
