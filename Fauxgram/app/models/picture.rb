class Picture < ApplicationRecord
  validates_presence_of :img_link, :created_by
end
