class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.references :group, foreign_key: true
      t.references :enemy, foreign_key: true
      t.timestamps
    end
  end
end
