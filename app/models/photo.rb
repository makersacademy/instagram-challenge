class Photo < ApplicationRecord

  has_attached_file :image, styles: { large: '600x600>', medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user

  def local_time_stamp
    print_time_stamp(self.created_at.localtime)
  end

  def local_date_stamp
    print_date_stamp(self.created_at.localtime)
  end

private
  def print_time_stamp(datetime)
    datetime.strftime('%H:%M')
  end

  def print_date_stamp(datetime)
    datetime.strftime('%d/%m/%Y')
  end

end
