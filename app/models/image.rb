class Image < ActiveRecord::Base

  belongs_to :user
  has_many :comments,
            -> { extending WithUserAssociationExtension },
            dependent: :destroy

  validates :description, presence: true, allow_blank: false
  has_attached_file :picture,
                    :styles => { :large => "800x600", :medium => "300x300>", :thumb => "100x100>"}
  validates_attachment_presence :picture, message: "needs to be uploaded"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\z/

  def show_comments
    Comment.where(image_id: self.id).map { |comment| [comment, User.find(comment.user_id).username + ' says: ' + comment.content] }
  end

  def get_username_of_creator
    User.find(self.user_id).username
  end

  private

  def destroy_as(user)
    return false unless self.user == user
    destroy
    true
  end

end
