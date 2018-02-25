class Pict < ApplicationRecord
  has_attached_file :image
  validates :image, presence: true
  validates :title, presence: true
  validate  :has_question_mark

  validates_attachment_content_type :image, :content_type =>
    /\Aimage\/.*\Z/

  private
    def has_question_mark
       errors.add(:title, "Title needs a question mark at the end") unless title[-1] == '?'
    end

end
