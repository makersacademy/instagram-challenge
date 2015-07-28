class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy

  has_attached_file :image,
                    :styles => {
                      :large => {
                        :geometry => '500x500#',
                        :format => 'jpg',
                        :quality => 95,
                        :convert_options => '-colorspace Gray'
                      },
                      :medium => {
                        :geometry => '250x250#',
                        :format => 'jpg',
                        :quality => 75,
                        :convert_options => '-colorspace Gray'
                      },
                      :thumb => {
                        :geometry => '100x100#',
                        :format => 'jpg',
                        :quality => 40,
                        :convert_options => '-colorspace Gray'
                      },
                    },
                    :default_url => "",
                    :path => "#{Rails.root}/public/system/:class/images/:id_partition/:style/:basename.:extension",
                    :storage => :filesystem

  validates_attachment_content_type :image,
                                    :content_type => /\Aimage\/.*\Z/

  validates_presence_of :name

end
