class Post < ActiveRecord::Base

    has_many :comments, dependent: :destroy
    belongs_to :user
    validates :title, length: { minimum: 3 }, uniqueness: true

    has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

    def belongs_to_user?(user)
      self.user_id == user.id
    end

end
