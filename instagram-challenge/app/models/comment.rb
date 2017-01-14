class Comment < ApplicationRecord
  belongs_to :post

  # def build_with_user(attributes = {}, user)
  #   attributes[:user] ||= user
  # end
  #
  # def create_with_user(attributes = {}, user)
  #   attributes[:user] ||= user
  # end
  #
  # def create_with_user!(attributes = {}, user)
  #   attributes[:user] ||= user
  # end

end
