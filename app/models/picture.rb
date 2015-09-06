class Picture < ActiveRecord::Base

  has_many :comments, dependent: :destroy

  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/restaurant-md.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def timestamp
    time_passed = Time.now - self.created_at
    if (time_passed < 60)
      return "a moment ago"
    elsif (time_passed < 3600)
      return "#{time_passed / 60}m"
    else
      return "#{time_passed / 3600}h"
    end
  end

  def build_comment(params, user)
    self.comments.create(thoughts: params[:thoughts], user_id: user.id)
  end

end
