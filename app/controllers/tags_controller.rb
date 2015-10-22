class TagsController < ApplicationController
  def show
    p params[:tag_id]
    @tag = Tag.find(params[:tag_id])
  end
end
