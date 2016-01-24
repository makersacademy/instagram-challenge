class Picture < ActiveRecord::Base
  has_attached_file :image,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_many :comments
  has_many :likes

  def build_comment(comment_params, current_user)
    comment = comments.build({comment: comment_params[:comment], user: current_user})
  end
end
