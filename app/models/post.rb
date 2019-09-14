class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validate :image_presence
  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags
  after_commit :create_hash_tags, on: :create

  def extract_name_hash_tags
    description.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end
  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

  def create_hash_tags
    extract_name_hash_tags.each do |name|
      hash_tags.create(name: name)
    end
  end


end

