module WithUserAssociationExtension
  def create_with_user(attributes = {}, user)
   attributes[:username] ||= user
   create(attributes)
  end
end
