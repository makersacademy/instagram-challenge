# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gram

  def get_email
    User.find(user_id).email
  end
end
