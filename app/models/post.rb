class Post < ApplicationRecord
   has_one_attached :image
   belongs_to :user

   # def user_email
   #  user.email
   # end

end
