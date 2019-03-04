# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def username
    User.find(user_id).username
  end

end
