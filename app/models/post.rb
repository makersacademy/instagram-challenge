class Post < ActiveRecord::Base
  belongs_to :user

  has_many :irons,
  -> { extending WithUserAssociationExtension },
  dependent: :destroy

  has_many :comments,
  -> { extending WithUserAssociationExtension },
  dependent: :destroy


  has_attached_file :image, :styles => { :medium => "500x500>" },
  :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :image, presence: { scope: :image,
    message: "You must upload an image to create a post" }

    def destroy_if_created_by?(current_user)
      return false unless current_user.posts.include?(self)
      self.destroy
      true
    end

  end
