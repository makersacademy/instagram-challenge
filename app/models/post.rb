class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :digs, dependent: :destroy

  validates :title, length: {minimum: 5}

  has_attached_file :image, :styles => { :large => "500x500", :medium => "250x250>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def build_comment(params, user)
    comment = comments.build(params)
    comment.user = user
    comment
  end

end
