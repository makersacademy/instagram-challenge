module PostsHelper

  def username(name)
    name.split('@').first
  end
end
