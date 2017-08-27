class User < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_and_belongs_to_many :followers,
              class_name: "User",
              join_table: :user_followers,
              foreign_key: :user_id,
              association_foreign_key: :follower_id,
              dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_param
    username
  end

  def self.followed_users(user)
    User.all.select { |u| u.followers.include? user }
  end
end
