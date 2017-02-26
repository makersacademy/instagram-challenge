class WoofsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @woof = Woof.new
  end

  def create
    @woof = Woof.new(visible: true)
    Woof.create(visible: true)
    count = woof.id
    redirect_to '/posts'
  end
end
