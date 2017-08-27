class User < ApplicationRecord
  has_many :photos
  has_many :comments
  has_many :likes

  has_and_belongs_to_many :followers,
              class_name: "User",
              join_table: :user_followers,
              foreign_key: :user_id,
              association_foreign_key: :follower_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_param
    username
  end
end
