class CreateEnemies < ActiveRecord::Migration[5.2]
  def change
    create_table :enemies do |t|
      t.string  :name,     null: false, unique: true
      t.string  :image
      t.integer :hp,  null: false
      t.integer :rank,  null: false
      t.timestamps
    end
  end
end
