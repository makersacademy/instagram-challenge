class Current < ActiveSupport::CurrentAttributes
  # makes Current.user accessible in view files.
  attribute :user
end