class JwtService
  def self.encode(payload)
    JWT.encode(payload, rails_master_key, 'HS256')
  end

  def self.decode(token)
    body, = JWT.decode(token,
                       rails_master_key,
                       true,
                       algorithm: 'HS256')
    HashWithIndifferentAccess.new(body)
  rescue JWT::ExpiredSignature
    nil
  end

  private

  def self.rails_master_key
    return Rails.application.secrets.secret_key_base unless ENV['RAILS_ENV'] == 'production'

    ENV['SECRET_KEY_BASE']
  end
end
