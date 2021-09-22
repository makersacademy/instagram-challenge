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
  validates :password,
            length: {
              maximum: 32,
              too_long: '%{count} characters is the maximum allowed',
            }
  validates :password,
            length: {
              minimum: 8,
              too_long: '%{count} characters is the minimum allowed',
            }

  has_one_attached :avatar do |attachable|
    return attachable.representation(resize_to_limit: [nil, 500])
  end
end
