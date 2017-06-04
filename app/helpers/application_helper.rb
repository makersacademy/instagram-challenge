module ApplicationHelper
  def date(post)
    post.created_at.strftime("%d/%m/%Y at %H:%M")
  end
end
