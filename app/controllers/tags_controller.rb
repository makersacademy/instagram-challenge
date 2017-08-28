class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_text(params[:id])
  end
end
