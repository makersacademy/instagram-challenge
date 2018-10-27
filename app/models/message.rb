class Message < ApplicationRecord
  belongs_to :user

  def format_date
    full_time = created_at
    full_time.strftime('%A, %-d %b %Y at %-I:%M %p')
  end
end
