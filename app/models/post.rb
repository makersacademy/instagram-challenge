class Post < ApplicationRecord
  belongs_to :user

  def uploaded_picture=(picture_field)
    self.content_type = picture_field.content_type.chomp
    self.picture = picture_field.read
  end
end
