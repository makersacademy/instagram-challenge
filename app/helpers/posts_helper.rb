module PostsHelper
  
  def build_filtered_image_for post
    image_tag(post.image, :class => "image-post #{post.filter}")
  end

end
