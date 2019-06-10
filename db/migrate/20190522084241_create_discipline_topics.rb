class CreateDisciplineTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :discipline_topics do |t|
      t.references :discipline, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
