module PostsHelper

  def format_time(time)
    time = Time.parse(time)
    minutes_since_post = ((Time.now - time)/60).floor()

    if minutes_since_post < 1
      return "Less than a minute ago"
    elsif minutes_since_post == 1
      return "1 minute ago"
    elsif minutes_since_post < 60
      return "#{minutes_since_post} minutes ago"
    elsif minutes_since_post >= 60
      hours_since_post = minutes_since_post/60
      if hours_since_post < 24
        return "#{hours_since_post}h"
      else
        days_since_post = hours_since_post/24
        if days_since_post < 7
          return "#{days_since_post}d"
        else
          weeks_since_post = days_since_post/7
          return "#{weeks_since_post}w"
        end
      end
    end

  end

end
