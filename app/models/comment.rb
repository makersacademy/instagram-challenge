class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  delegate :username, to: :user, allow_nil: true

  def formatted_time
    created_at.nil? ? nil : created_at.strftime("%-dth %b, %l:%M%P")
  end
end
