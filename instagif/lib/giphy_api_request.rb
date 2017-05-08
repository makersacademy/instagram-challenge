require 'httparty'

class GiphyApi
  include HTTParty
  API_URL = "api.giphy.com"
  API_KEY = "dc6zaTOxFJmzC"

  def get_response
    formatted_request = format_request('test')
    self.class.get(formatted_request)
  end

  def translate_request_url(generator_string)
    return if generator_string.empty?
    formatted_request = format_request(generator_string)
    giphy_response = self.class.get(formatted_request)
    giphy_response['data']['images']['fixed_height']['url']
  end

  def format_request(generator_string)
    "http://" + API_URL + "/v1/gifs/translate?s=" + generator_string + "&api_key=" + API_KEY
  end
end
