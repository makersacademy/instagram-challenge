class EntriesController < ApplicationController
  def index 
    @entries = Entry.all
  end 


  def create 
    entry_params = params['entry'].permit('image', 'description')
    entry = Entry.create(entry_params)
    redirect_to(entries_path)
  end 
end
