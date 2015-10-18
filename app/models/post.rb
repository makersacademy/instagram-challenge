class Post < ActiveRecord::Base

  belongs_to :user

  def self.build_with_user(params, user)
    self.new(description: params['description'], user_id: user.id)
  end

end
