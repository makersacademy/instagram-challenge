class CreateGrams < ActiveRecord::Migration[5.2]
  def change
    create_table :grams do |t|
      t.references :attachment, :polymorphic => {:default => 'picture'} #Not actually sure how this line works...
      t.text :text

      t.timestamps
    end
  end
end
