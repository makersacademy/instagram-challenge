# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @posts = Post.all
      render 'index'
    end
  end
end
