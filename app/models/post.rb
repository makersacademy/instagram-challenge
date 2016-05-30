class Post < ActiveRecord::Base
  has_attached_file :image,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}
  validates :title, :description, :image, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable

  def belongs_to? some_user
    user == some_user
  end



end
