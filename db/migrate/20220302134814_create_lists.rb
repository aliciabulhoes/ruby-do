class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.references :users, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
