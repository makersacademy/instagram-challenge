class Post < ActiveRecord::Base

  belongs_to :user

  has_attached_file :image,
                    :styles => { :medium => "250x250#", :thumb => "100x100#" },
                    :default_url => ""
                    # :path => "#{Rails.root}/public/system/:class/images/:id_partition/:style/:basename.:extension",
                    # :storage => :filesystem

  validates_attachment_content_type :image,
                                    :content_type => /\Aimage\/.*\Z/

  validates_presence_of :name

end
