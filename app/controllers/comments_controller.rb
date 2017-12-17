class CommentsController < ApplicationController
skip_before_action :verify_authenticity_token

    def create
      @picture = Picture.find(params[:picture_id])
      @comment = @picture.comments.create(params[:comment].permit(:content))
      redirect_to picture_path(@picture)
    end

end
