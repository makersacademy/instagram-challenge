class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    'Yo'
  end
end
