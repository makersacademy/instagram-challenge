class AddPhraseToTags < ActiveRecord::Migration
  def change
    add_column :tags, :phrase, :string
  end
end
