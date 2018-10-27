# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    if user_signed_in?
      @posts = Post.all.order('created_at DESC')
      render 'index'
    end
  end
end
