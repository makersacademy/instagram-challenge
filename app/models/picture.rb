class Picture < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :title, length: { minimum: 1, maximum: 50 }
  validates_presence_of :image_file_name, message: 'Please upload a picture'

  def add_comments(comment_params, current_user)
    c = Comment.new(comment_params)
    c.user_id = current_user.id
    c.picture_id = self.id
    c
  end

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%")
  end

end
