class Iron < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user, uniqueness: { scope: :post, message: "you have ironed this post already" }

  def destroy_if_created_by?(current_user)
    return false unless current_user.irons.include?(self)
    self.destroy
    true
  end

end
