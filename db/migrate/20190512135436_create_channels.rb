class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :yt_id
      t.string :name
      t.references :user
      t.text :description
      t.string :thumbnail_url
      t.time :published_at
      t.boolean :public

      t.timestamps
    end
  end
end
