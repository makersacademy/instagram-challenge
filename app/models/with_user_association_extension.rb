module WithUserAssociationExtension
  def create_with_user(user, attributes = {})
   attributes[:user] ||= user
   create(attributes)
  end

  def build_with_user(user, attributes = {})
    attributes[:user] ||= user
    build(attributes)
  end
end
