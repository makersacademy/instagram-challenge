class SampleNameChangeColumnType < ActiveRecord::Migration
    def change
    change_column(:images, :image_id, :string)
end
end
