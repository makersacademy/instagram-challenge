# frozen_string_literal: true

module ApplicationHelper
  def header(text)
    content_for(:header) { text.to_s }
  end
end
