class Post < ApplicationRecord
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
end
