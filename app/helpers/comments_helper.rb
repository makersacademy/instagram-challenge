module CommentsHelper
  def created_since(time)
    hour = (Time.now - time) / 3600
    pluralize(hour.floor, 'hour') + ' ago'
  end
end
