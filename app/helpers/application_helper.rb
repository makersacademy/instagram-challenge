module ApplicationHelper
  def flash_class(level)
    case level
        when 'notice' then "alert alert-dismissable alert-info"
        when 'success' then "alert alert-dismissable alert-success"
        when 'error' then "alert alert-dismissable alert-danger"
        when 'alert' then "alert alert-dismissable alert-danger"
    end
  end
end
