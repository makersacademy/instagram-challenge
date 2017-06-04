class Photo < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", large: "800x800>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  belongs_to :user

  def local_time_stamp
    self.created_at.localtime.strftime('%H:%M, %d/%m/%Y')
  end
end
