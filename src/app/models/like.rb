class Like < ApplicationRecord
    belongs_to :users, class_name: Users
    belongs_to :pictures, class_name: Pictures
end
