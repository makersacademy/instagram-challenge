class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_attached_file :image, styles: { medium: "700x", thumb: "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :image, presence: true
  validates :user_id, presence: true

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip.delete('#')).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name)
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end
end
