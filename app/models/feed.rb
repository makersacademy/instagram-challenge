class Feed < ApplicationRecord
  belongs_to :user
  has_many :photos


  def self.time(created_at)
    return "Today" if created_at.strftime("%b %d, %Y") == Time.now.strftime("%b %d, %Y")
    return  created_at.strftime("%b %d, %Y")
  end
end
