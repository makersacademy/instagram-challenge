class AddPolymorphicReferenceToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :commentable, polymorphic: true
  end
end
