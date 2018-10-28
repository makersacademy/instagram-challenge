# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsHelper, type: :helper do
  describe '#get_comment_email' do
    it 'gets the correct email for a given user_id' do
      user = User.create(email: 'testabc123@mail.com', password: 'password')
      expect(helper.get_comment_email(user.id)).to eq 'testabc123@mail.com'
    end
  end
end
