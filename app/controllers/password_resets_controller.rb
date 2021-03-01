class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            # PasswordMailer.with(user: @user).reset.deliver_later
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        redirect_to root_path, notice: 'A password reset link has been sent to the supplied email address'
        return
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: 'password_reset' )
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to sign_in_path, alert: 'Your password reset token has expired. Please try again.'
        return
    end
    
    def update
        @user = User.find_signed!(params[:token], purpose: 'password_reset' )
        if @user.update(password_params)
            redirect_to sign_in_path, notice: 'Your password has been reset. Please sign in with your new credentials'
            return
        else
            render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end