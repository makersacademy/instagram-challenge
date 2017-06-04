module ApplicationHelper
  def date(post)
    post.created_at.strftime("%d/%m/%Y at %H:%M")
  end

  def date_joined(post)
    post.created_at.strftime("%d/%m/%Y")
  end
end
