class Post < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :user

  def self.build_with_user(params, user)
    self.new(description: params['description'], user_id: user.id)
  end

end
