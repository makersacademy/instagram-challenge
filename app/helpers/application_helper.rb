module ApplicationHelper
  def post_recency(created_at)
    t = time_ago_in_words(created_at, :highest_measure_only => true, :vague => :seconds)
    return 'less than 1 minute' if t == "1 minute"
    t
  end

  def post_exact_time(created_at)
     created_at.strftime("%d/%m/%Y at %I:%M%p")
  end
end
