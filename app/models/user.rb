class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || 'is not an email')
    end
  end
end
class User < ApplicationRecord
  include ActiveModel::Validations
  has_secure_password
  validates :email, presence: true, uniqueness: true, email: true
  validates :username, presence: true, uniqueness: true
end
