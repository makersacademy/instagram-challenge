# frozen_string_literal: true

# Helper functions for the Application
module GramsHelper
  def get_email_for_gram(gram)
    User.find(gram.user_id).email
  end

  def gram_poster_logged_in(gram)
    return false unless current_user

    current_user.id == gram.user_id
  end

  def number_of_comments(gram)
    Comment.where(gram_id: gram.id).count
  end

  def number_of_likes(gram)
    Like.where(gram_id: gram.id).count
  end
end
