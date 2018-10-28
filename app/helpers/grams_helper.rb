# frozen_string_literal: true

# Helper functions for the Application
module GramsHelper
  def get_email_for_gram(gram)
    User.find(gram.user_id).email
  end
end
