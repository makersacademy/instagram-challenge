class User < ApplicationRecord
    has_secure_password
    has_many :pictures, :foreign_key => 'user_id', :class_name => 'Picture'
    has_many :comments, :foreign_key => 'user_id', :class_name => 'Comment'
    has_many :likes, :foreign_key => 'user_id', :class_name => 'Like'

end
