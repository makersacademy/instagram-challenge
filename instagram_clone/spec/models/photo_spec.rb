require 'rails_helper'
require 'paperclip/matchers'

describe Photo, type: :model do
  it {is_expected.to have_attached_file(:image) }
end
