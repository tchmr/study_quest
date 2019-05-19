class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string        :name, null: false
      t.integer       :leader, null: false
      t.date          :quest_start_ymd, null: false
      t.timestamps
    end
  end
end
