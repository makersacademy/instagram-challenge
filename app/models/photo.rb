class Photo < ActiveRecord::Base
  has_attached_file :image,
                    styles: { large: "600x600>",
                              medium: "400x400>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many   :comments, dependent: :destroy
  has_many   :likes,
             -> { extending WithUserAssociationExtension },
             dependent: :destroy
  belongs_to :user

  def created_by?(user)
    self.user == user
  end

  def time_posted
    return "#{Time.now.hour - created_at.hour}h" if posted_today?
    "#{Time.now.day - created_at.day}d"
  end

  def posted_today?
    Time.now.day == created_at.day
  end
end
