# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post

  def user
    @user = User.find(user_id)
    @user.email
  end
  
end
