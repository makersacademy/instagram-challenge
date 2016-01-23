class Picture < ActiveRecord::Base
  has_attached_file :image,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user

  def find_user(user_id)
    @user_id = Picture.find(user_id)
    @username = User.find(@user_id).username
  end
end
