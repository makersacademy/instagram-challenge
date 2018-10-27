class MessageController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.all.reverse
  end

  # adapt this to user#show
  def profile
    @messages = Message.where(user_id: params[:user_id])
  end

  def new
    @message = current_user.messages.new
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = current_user.messages.create(message_params)
    redirect_to message_index_path
  end

  def edit
    @message = current_user.messages.find(params[:id])
  end

  def update
    @message = current_user.messages.find(params[:id])
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_url, notice: 'Your message has been deleted'
  end

  private
  def message_params
    params.require(:message).permit(:text)
  end
end
