module ApplicationHelper
  def post_recency(created_at)
    time = time_ago_in_words(created_at,
      :highest_measure_only => true,
      :vague => :seconds)
    return 'less than 1 minute' if time == "1 minute"
    time
  end

  def post_exact_time(created_at)
     created_at.strftime("%d/%m/%Y at %I:%M%p")
  end
end
