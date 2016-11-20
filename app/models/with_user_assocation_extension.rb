module WithUserAssociationExtension

  def create_with_user_foreign_key(attributes = {}, user)
   attributes[:user] ||= user
   create(attributes)
  end

  def create_with_user_foreign_key!(attributes = {}, user)
    attributes[:user] ||= user
    create!(attributes)
  end


  def build_review_with_user_foreign_key(attributes = {}, user)
    attributes[:user] ||= user
    build(attributes)
  end

end
