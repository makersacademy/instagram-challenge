class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image
  validates :text, presence: true
  validate :check_text_for_type_here

  private

  def check_text_for_type_here
    if self.text == "Type a comment here…"
      errors.add(:text, 'Comment cannot equal "Type a comment here…"')
    end
  end
end
