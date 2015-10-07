class Picture < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def timestamp
    time_passed = (Time.now - self.created_at).to_i
    return "a moment ago" if time_passed < 60
    return "#{time_passed / 60}m ago" if time_passed < 3600
    return "#{time_passed / 3600}h ago" if time_passed < 86400
    return "#{time_passed / 86400}d ago"
  end

  def build_comment(params, user)
    self.comments.create(thoughts: params[:thoughts], user_id: user.id)
  end

end
