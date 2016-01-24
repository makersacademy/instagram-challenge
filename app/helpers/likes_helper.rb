module LikesHelper
  def generate_unlike_json(picture, like)
    {
      likes: view_context.pluralize(picture.likes.count, 'like'),
      link: view_context.link_to(
        'Unlike', like_path(like.id), class: 'like full-like', method: :delete)
    }
  end
  def generate_like_json(picture)
    {
      likes: view_context.pluralize(picture.likes.count, 'like'),
      link: view_context.link_to(
        'Like', picture_likes_path(picture), class: 'like empty-like',
        method: :post)
    }
  end
end
