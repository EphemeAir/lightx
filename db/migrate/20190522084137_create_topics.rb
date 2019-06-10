class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :name
      t.string :wiki_name
      t.boolean :wiki_analysed

      t.timestamps
    end
  end
end
