class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
    sql = "SELECT pictures.*, users.username,
            c.message, c.username as username_comment
            FROM pictures 
            INNER JOIN users 
            ON pictures.user_id = users.id
            LEFT JOIN (
              SELECT comments.picture_id, comments.message, users.username
              FROM comments
              INNER JOIN users
              ON comments.user_id = users.id
            ) AS c
            ON c.picture_id = pictures.id
            ORDER BY pictures.created_at DESC"
    @pictures = ActiveRecord::Base.connection.execute(sql)
  end

  def create
    if session[:user_id] != nil
      @picture = Picture.create({user_id: session[:user_id], image_text: params[:picture]['image_text']})
      @user = User.find(session[:user_id])
      redirect_to "/pictures/new"
    end
  end

end
