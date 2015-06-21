class LikesController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    @picture.likes.create
    render json: {new_like_count: @picture.likes.count}
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.likes.last
    @like = @picture.likes.last
    @like.destroy
    redirect_to ('/')
    #deleting 2 likes for some reason and sometimes across multiple pictures e.g. click dislike on second photo and deletes one from that and one from the first
    #why when I rendered json here did it show the json object vs redirect with my ajax call
  end
end