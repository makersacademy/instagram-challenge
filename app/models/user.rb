class User < ApplicationRecord
  include WithUserAssociationExtension
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, -> { extending WithUserAssociationExtension },
  dependent: :destroy
end
