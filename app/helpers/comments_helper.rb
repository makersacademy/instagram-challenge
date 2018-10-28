# frozen_string_literal: true

# Helper methods for the Comments controller
module CommentsHelper
  def get_comment_email(user_id)
    User.find(user_id).email
  end
end
