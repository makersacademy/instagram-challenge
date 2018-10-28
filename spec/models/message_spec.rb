# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#format_date' do
    it 'formats date' do
      Timecop.freeze(Time.zone.parse('13:00 3 October 2018'))
      message = Message.new(text: "test")
      message.created_at = Time.now
      expect(message.format_date).to eq "Wednesday, 3 Oct 2018 at 1:00 PM"
    end
  end
end
