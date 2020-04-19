class Post < ApplicationRecord
  default_scope { order created_at: :desc}
  mount_uploader :image, ImageUploader
  belongs_to :account

  has_many :likes
  
  before_create :set_active
  
  def total_likes
    0
  end

  private

  scope :active, -> { where active: true }
  def set_active
    self.active = true
  end
end

