MINUTE_DIVISOR = 60
HOURS_DIVISOR = 3600
DAYS_DIVISOR = 86400

def time_since_post(post)
  time_now = Time.new
  post_time = post.created_at
  time_since = (time_now - post_time)
  time_since = time_since.round
  if time_since < MINUTE_DIVISOR
    "#{time_since} seconds ago"
  elsif time_since >= MINUTE_DIVISOR && time_since < 120
    "#{(time_since / MINUTE_DIVISOR).round} minute ago"
  elsif time_since >= 120 && time_since < 3600
    "#{(time_since / MINUTE_DIVISOR).round} minutes ago"
  elsif time_since >= HOURS_DIVISOR && time_since < 86400
    "#{(time_since / HOURS_DIVISOR).round} hours ago"
  elsif time_since >= DAYS_DIVISOR
    "#{(time_since / DAYS_DIVISOR).round} days ago"
  end

end
