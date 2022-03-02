class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :lists, null: false, foreign_key: true
      t.string :name
      t.datetime :due_date, { null: true }
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
