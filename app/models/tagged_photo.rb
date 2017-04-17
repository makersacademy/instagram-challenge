class TaggedPhoto < ActiveRecord::Base
  belongs_to :photo
  belongs_to :tag
end
