class AddProjectIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :project, index: true, foreign_key: true
  end
end
