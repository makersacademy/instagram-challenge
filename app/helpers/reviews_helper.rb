module ReviewsHelper

  def star_rating(rating)
        return rating unless rating.respond_to?(:round)
        remainder = (5 - rating)
        "★" * rating.round + "☆" * remainder
    end
end
