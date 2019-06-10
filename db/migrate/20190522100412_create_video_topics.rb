class CreateVideoTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :video_topics do |t|
      t.references :video, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
