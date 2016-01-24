class Picture < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :image, presence: true

  has_attached_file :image,
                    :styles => {  :medium => "800x800>",
                                  :thumb => "200x200>" },
                    :default_url => "/images/:style/missing.jpeg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def was_created_by?(user)
    user.id === self.user_id
  end

  def build_comment(params, user)
    comment = comments.new(picture_id: self.id,
                            message: params[:message])
    comment.user_id = user.id
    return comment
  end

end
