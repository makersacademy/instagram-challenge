class Picture < ActiveRecord::Base

  has_attached_file :image,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                                 :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes

  def has_been_liked_by?(current_user)
    likes.map { |like| like.userid }.include? (current_user.id)
  end
end
