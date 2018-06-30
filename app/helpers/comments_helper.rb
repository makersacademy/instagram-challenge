# frozen_string_literal: true

module CommentsHelper
  def render_stars(value)
    if (1..5).include?(value)
      # value.times { output += image_tag("star.png") }
      # value.times { render :partial => '_partials/star' }

      render partial: '_partials/star', locals: { rating: value }

    end
  end
end
