module ApplicationHelper

  def flash_alerts(level)
    case level
      when :notice then "alert alert-info"
      when :notice then "alert alert-success"
      when :notice then "alert alert-error"
      when :notice then "alert alert-error"
    end 
  end

end
