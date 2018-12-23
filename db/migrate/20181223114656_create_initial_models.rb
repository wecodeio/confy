class CreateInitialModels < ActiveRecord::Migration[5.2]
  def change
    create_table :conferences do |t|
      t.string :title
      t.string :description
      t.date :start_date
      t.date :end_date
      t.string :place
      t.string :url
      t.string :slug

      t.timestamps
    end

    create_table :talks do |t|
      t.string :title
      t.string :description
      t.string :video_url
      t.string :slug

      t.integer :speaker_id
      t.integer :conference_id

      t.timestamps
    end
  end
end
