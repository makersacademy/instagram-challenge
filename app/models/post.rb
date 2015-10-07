class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :likes
  has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, presence: true
  belongs_to :user

  def create_like user
    @like = self.likes.build
    @like.user_id = user.id
    @like.save
  end

  def create_comment comment_params, user
    @post = self.comments.create(thoughts: comment_params[:thoughts], user_id: user.id)
  end
end

