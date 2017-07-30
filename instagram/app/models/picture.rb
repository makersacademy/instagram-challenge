class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes

  has_many :filters
  has_many :tags, through: :filters

  has_attached_file :image, styles: { medium: "700x", thumb: "250x250>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :user_id, presence: true
  validates :image, presence: true

  #
  # def tags=(tag_array)
  #   self.tags = tag_array.split(',').map do |tag|
  #     Tag.where(title: tag).first_or_create!
  #   end
  # end

  # def get_tags
  #   self.tags.map(&:title)
  # end

end
