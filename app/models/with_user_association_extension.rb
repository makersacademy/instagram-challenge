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

  def update_with_user(attributes = {}, user)
    attributes[:user] ||= user
    update_attributes(attributes)
  end

end
