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

  def delete_with_user(object, user_id)
    if object.user_id == user_id
      object.destroy
      true
    else
      false
    end
  end
end
