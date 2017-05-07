class Travelgram < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :name, length: {minimum: 3}, uniqueness: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def build_comment(comments_params, user)
    comments_params[:user] ||= user
    comments.new(comments_params)
  end
end
