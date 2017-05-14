class Picture < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def build_comment(comment_params, user)
    comment_params[:user] = user
    comments.build(comment_params)
  end

  def build_like(user)
    likes.build(user: user)
  end

end
