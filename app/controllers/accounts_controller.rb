class AccountsController < ApplicationController
    before_action :authenticate_account!
    before_action :set_post, only: [:profile], as: :profile

    def index
        #user dashboard post-feed
        @posts =Post.active
    end

    def profile
        #profile
    end

    def set_account
        @account = Account.find_by_username(params[:username])
    end
end
