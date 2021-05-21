class EntriesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index 
    @entries = Entry.all.order("created_at DESC")
  end 

  def new
    @entry = current_user.entries.build
  end 

  def show 
    redirect_to(entries_path)
  end  

  def create 
    @post = current_user.entries.build(entry_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end 

  def edit 
    @entry = Entry.find(params['id'])
  end 

  def update 
    entry = Entry.find(params['id'])
    entry.update(entry_params)
    redirect_to(entries_path)
  end 

  private 

  def entry_params
    params.require(:entry).permit(:image, :description, :user_id)
  end
end
