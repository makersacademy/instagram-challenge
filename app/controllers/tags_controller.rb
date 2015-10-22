class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:tag_id])
  end
end
