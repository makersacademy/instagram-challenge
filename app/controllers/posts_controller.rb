class PostsController < ApplicationController
    before_action :require_user_logged_in!

    def index
        @posts = Current.user.posts
    end
end