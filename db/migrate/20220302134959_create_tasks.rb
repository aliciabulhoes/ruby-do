class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :list, null: false, foreign_key: { on_delete: :cascade }
      t.string :name
      t.datetime :due_date
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
