# frozen_string_literal: true

# Inherits from ActiveRecord to allow us to access a database.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
