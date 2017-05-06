class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def build_comment(comment_params, user)
    review_params[:user] ||= user
    reviews.new(comment_params)
  end
end
