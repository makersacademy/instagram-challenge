class Comment < ApplicationRecord
    belongs_to :users, class_name: User
    belongs_to :pictures, class_name: Pictures
end
