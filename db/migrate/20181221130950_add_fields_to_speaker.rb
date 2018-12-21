class AddFieldsToSpeaker < ActiveRecord::Migration[5.2]
  def change
    add_column :speakers, :slug, :string
    rename_column :speakers, :full_name, :name
  end
end
