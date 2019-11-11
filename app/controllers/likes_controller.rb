class LikesController < ApplicationController
  before_action :find_likeable
  before_action :authenticate_user!

  def like
    @likeable.liked_by current_user
  end

  def unlike
    @likeable.disliked_by current_user
  end

  private
  def find_likeable
    @likeable_type = params[:likeable_type].classify
    @likeable = @likeable_type.constantize.find(params[:likeable_id])
  end
end
