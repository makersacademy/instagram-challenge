class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :image

  validates :content, presence: true, allow_blank: false

  def destroy_as(user)
    return false unless self.user == user
    destroy
    true
  end

end
