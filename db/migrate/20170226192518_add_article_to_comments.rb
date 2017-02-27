class AddArticleToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :article, index: true,foreign_key: true
  end
end
