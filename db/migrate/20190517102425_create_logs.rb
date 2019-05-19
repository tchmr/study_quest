class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :achieve_time, null: false
      t.date :achieve_ymd, null: false
      t.timestamps
    end
  end
end
