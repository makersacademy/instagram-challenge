class Travelgram < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :name, length: {minimum: 3}, uniqueness: true

  def build_comment(comments_params, user)
    comments_params[:user] ||= user
    comments.new(comments_params)
  end
end
