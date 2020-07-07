class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  delegate :username, to: :user

  def formatted_time
    created_at.strftime("%-dth %b, %l:%M%P")
  end
end
