class Like < ActiveRecord::Base
  belongs_to :upload
  belongs_to :user
  validates :user, uniqueness: { scope: :upload }
end
