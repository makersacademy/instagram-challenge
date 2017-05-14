require 'rails_helper'

RSpec.describe Gif, type: :model do
  it 'is not valid if generator string is empty' do
    gif = Gif.new(generator: '')
    expect(gif).to have(1).error_on(:generator)
    expect(gif).not_to be_valid
  end
end
