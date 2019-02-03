module ApplicationHelper
  def alert_for(alert)
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert-warning',
      :notice => 'alert-info'
    }[alert.to_sym] || alert.to_s
  end
end
