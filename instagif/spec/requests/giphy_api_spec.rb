require 'rails_helper'
require './lib/giphy_api_request'

describe GiphyApi do


  before do
    @giphy = GiphyApi.new
  end

it 'gets a successful response from the API' do
  expect(@giphy.get_response['meta']['status']). to eq(200)
  end

it 'returns a gif URl based on the generator string input' do
  expect(@giphy.translate_request_url('test')).to match(/(?:(?:(?:[A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)(?:(?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)(?:gif)/)
  end

end
