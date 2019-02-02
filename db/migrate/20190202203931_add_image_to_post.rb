class AddImageToPost < ActiveRecord::Migration[5.1]
    def up
      add_attachment :posts, :image
    end

    def down
      remove_attachment :posts, :image
    end
end
