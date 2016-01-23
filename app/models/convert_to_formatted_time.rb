module ConvertToFormattedTime
  def convert_time(minutes_since_midnight)
    hour = minutes_since_midnight/60
    formatted_mins = sprintf("%02d", minutes_since_midnight%60)
    "#{hour}:#{formatted_mins}"
  end
end
