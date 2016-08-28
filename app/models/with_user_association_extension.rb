module WithUserAssociationExtension

  def create_with_user(attributes = {}, user)
   attributes[:user] ||= user
   create(attributes)
  end

  def create_with_user!(attributes = {}, user)
    attributes[:user] ||= user
    create!(attributes)
  end

  def build_with_user(attributes = {}, user)
    attributes[:user] ||= user
    build(attributes)
  end

  def destroy_with_user(user)
    return false if self.user != user
    destroy
  end

end
