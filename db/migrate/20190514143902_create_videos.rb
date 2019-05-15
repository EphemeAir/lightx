class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :yt_id
      t.string :name
      t.references :channel, foreign_key: true
      t.text :description
      t.string :thumbnail_url
      t.integer :duration
      t.boolean :captioned
      t.time :published_at
      t.boolean :tagged
      t.boolean :public

      t.timestamps
    end
  end
end
