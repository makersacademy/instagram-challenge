module ApplicationHelper
  def get_time_ago(datetime)
    return time_ago_in_words(datetime.to_s)
  end
end
