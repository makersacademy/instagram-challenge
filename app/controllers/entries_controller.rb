class EntriesController < ApplicationController
  def index 
    @entries = Entry.all
  end 

  def show 
    redirect_to(entries_path)
  end   
  def create 
    entry_params = params['entry'].permit('image', 'description', 'user_id')
    entry = Entry.create(entry_params)
    redirect_to(entries_path)
  end 

  def edit 
    @entry = Entry.find(params['id'])
  end 

  def update 
    entry_params = params['entry'].permit('image', 'description', 'user_id')
    entry = Entry.find(params['id'])
    entry.update(entry_params)
    redirect_to(entries_path)
  end 
end
