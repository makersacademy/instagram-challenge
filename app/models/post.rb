class Post < ActiveRecord::Base

  after_initialize :defaults
  has_attached_file :image, styles: { medium: "300x300>" }
  # validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def defaults
    self.likes = 0
  end

  def add_like
    self.likes += 1
  end

end