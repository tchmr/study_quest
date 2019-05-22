class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.float :progress_rate, null: false
      t.references :user, foreign_key: true
      t.references :enemy, foreign_key: true

      t.timestamps
    end
  end
end
