class Filterspam < ActiveRecord::Base
  has_many :comments
  has_many :likes
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :user, presence: true

    def formatted_likes
      likes = self.likes.map{ |like| like.user.email }
      if likes.length == 1
        return "#{likes.first} likes this"
      else
        last = likes.pop
        return likes.join(', ') + " and #{last} like this"
      end
    end

end
