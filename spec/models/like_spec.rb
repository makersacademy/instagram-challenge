require 'rails_helper'

describe Like, type: :model do
  it{is_expected.to belong_to :upload}
  it{is_expected.to belong_to :user}
  it{is_expected.to respond_to :user_id}
end