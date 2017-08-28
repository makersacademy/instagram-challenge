class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_and_belongs_to_many :tags
  has_attached_file :image, styles: { none: {
                                        geometry: "500x500#"},
                                      lomo: {
                                        geometry: "500x500#",
                                        convert_options: "-channel R -level 33% -channel G -level 33%"},
                                      gotham: {
                                        geometry: "500x500#",
                                        convert_options: "-modulate 120,10,100 -fill '#222b6d' -colorize 20 -gamma 0.5 -contrast -contrast"},
                                      greyscale: {
                                        geometry: "500x500#",
                                        convert_options: "-grayscale Rec709Luminance"}
                                      }

  validates_attachment :image, presence: true,
  content_type: { content_type: /\Aimage\/.*\Z/ }

  def return_filter
    filter.to_sym unless filter.nil?
  end
end
