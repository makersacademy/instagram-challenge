module ApplicationHelper

  def alert_for(flash_type)
    { success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }[flash_type.to_sym] || flash_type.to_s
  end
end

# helper method is used to share methods defined in the controller and make them available to the view