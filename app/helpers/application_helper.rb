module ApplicationHelper
  def gravatar_url(email, size)
  gravatar = Digest::MD5::hexdigest(email).downcase
  url = "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end
end
