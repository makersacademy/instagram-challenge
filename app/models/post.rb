class Post < ApplicationRecord
  scope :active, -> { where active: true }
  belongs_to :user
  
  before_create :set_active

  scope :active, -> { where active: true }

  def set_active
    self.ctive = true
  end
end
