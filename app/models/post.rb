class Post < ApplicationRecord
validates :image, presence: true

has_attached_file :image, styles: { :medium => "640x" }

end
