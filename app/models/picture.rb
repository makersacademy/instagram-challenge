class Picture < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :title, length: { minimum: 1, maximum: 50 }

  def add_comments(comment_params, current_user)
    c = Comment.new(comment_params)
    c.user_id = current_user.id
    c.picture_id = self.id
    c
  end

end
