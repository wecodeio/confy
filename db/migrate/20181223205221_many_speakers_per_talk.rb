class ManySpeakersPerTalk < ActiveRecord::Migration[5.2]
  def change
    remove_column :talks, :speaker_id

    create_table :speakers_talks, id: false do |t|
      t.belongs_to :speaker, index: true
      t.belongs_to :talk, index: true
    end
  end
end
