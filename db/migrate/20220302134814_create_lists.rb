class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.string :title

      t.timestamps
    end
  end
end
