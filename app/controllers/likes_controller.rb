# frozen_string_literal: true

# Controller for Likes - Manages creation and destruction of likes
class LikesController < ApplicationController
  before_action :find_posts
  before_action :find_like, only: [:destroy]
end
