class Post < ApplicationRecord
  has_many :likes
  # belongs_to :user
  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x640#" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def time_ago
    second_difference = (Time.now - created_at).floor
    minute_difference = second_difference / 60
    hour_difference = minute_difference / 60
    day_difference = hour_difference / 24
    if day_difference > 0
      if day_difference == 1
        return "#{day_difference} day ago"
      else
        return "#{day_difference} days ago"
      end
    elsif hour_difference > 0
      if hour_difference == 1
        return "#{hour_difference} hour ago"
      else
        return "#{hour_difference} hours ago"
      end
    elsif minute_difference > 0
      if minute_difference == 1
        return "#{minute_difference} minute ago"
      else
        return "#{minute_difference} minutes ago"
      end
    elsif second_difference >= 0
      if second_difference < 5
        return "just now"
      else
        return "#{second_difference} seconds ago"
      end
    end
  end
end
