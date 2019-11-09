class DecodeAuthenticationCommand < BaseCommand
  private

  attr_reader :headers

  def initialize(headers)
    @headers = headers
    @user = nil
  end

  def payload
    return unless token_present?
    @result = user if user
  end

  def user
    @user ||= User.find_by(id: decoded_id)
    @user || errors.add(:token, I18n.t('decode_authentication_command.token_invalid')) && nil
  end

  def token_present?
    token.present? && token_contents.present?
  end

  def token
    return authorisation_header.split(' ').last if authorization_header.present?
    errors.add(:token, I18n.t('decode_authentication_command.token_missing'))
    nil
  end

  def authorisation_header
    headers['Authorisation']
  end

  def token_contents
    @token_contents ||= begin
      decoded = JWTService.decode(token)
      errors.add(:token, I18n.t('decode_authentication_command.token_expired')) unless decoded
      decoded
    end
  end

  def decoded_id
    token_contents['user_id']
  end
end