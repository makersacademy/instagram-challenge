class Post < ActiveRecord::Base
  has_attached_file :image,
                    :styles => {large: "800x800>", medium: "400x400>", thumbnail: "100x100#"},
                    :storage => :cloudinary,
                    :path => ':id/:style/:filename',
                    :cloudinary_credentials => Rails.root.join("config/cloudinary.yml"),
                    :cloudinary_upload_options => {
        :default => {
            :tags => [ 'Web' ],
            :context => {
                :caption => lambda { |style_name, attachment| attachment.instance.caption }
            }
        },
    }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :user
end
