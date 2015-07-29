class Image < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments,
            -> { extending WithUserAssociationExtension },
            dependent: :destroy

  validates :description, presence: true, allow_blank: false
  has_attached_file :picture,
                    :styles => { :large => "800x600", :medium => "300x300>", :thumb => "100x100>"}
  validates_attachment_presence :picture, message: "needs to be uploaded"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\z/

  def show_comments
    Comment.where(image_id: self.id).map { |comment| comment }
  end

  def get_username_of_creator
    User.find(self.user_id).username
  end

  def get_tags
    self.tags.map { |tag| [tag, tag.name] }
  end

  def add_tag(tag)
    existing_tag = Tag.find_by(name: tag)
    image_tags = self.tags.map { |tag| tag.name }
    if existing_tag && !image_tags.include?(tag)
      existing_tag.images << self
    else
      self.tags.create(name: tag)
    end
  end

  def destroy_as(user)
    return false unless self.user == user
    destroy
    true
  end

end
