module WithUserAssociationExtension
  def build_with_user(attributes = {}, user)
    attributes[:user] ||= user
    build(attributes)
  end
end
