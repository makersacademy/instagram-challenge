require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  def new
    @post = Post.new
  end
end
