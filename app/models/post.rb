class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :image, presence: true

  has_attached_file :image, :styles => { :medium => "1500x1500>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def build_comment(comment_params, user)
    comment_params[:user] ||= user
    comments.new(comment_params)
  end
end
