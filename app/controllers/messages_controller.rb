class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.all.reverse
  end

  # adapt this to user#show
  def profile
    @user = User.where(id: params[:user_id]).first
    @messages = Message.where(user_id: params[:user_id])
  end

  def new
    @message = current_user.messages.new
  end

  def create
    @message = current_user.messages.create(message_params)
    @message.image.attach(params[:message][:image])
    redirect_to messages_path
  end

  private
  def message_params
    params.require(:message).permit(:text, :image)
  end
end
