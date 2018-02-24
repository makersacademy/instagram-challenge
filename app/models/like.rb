class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :number, :inclusion => { :in => 1...2 }, presence: true
  validates :user_id, presence: true
end
