class Picture < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  validates :title, :image, presence: true

  has_attached_file :image,
                    :styles => {  :medium => "800x800>",
                                  :thumb => "200x200>" },
                    :default_url => "/images/:style/missing.jpeg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
