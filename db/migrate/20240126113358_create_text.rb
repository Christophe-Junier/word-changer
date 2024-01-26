class CreateText < ActiveRecord::Migration[7.1]
  def change
    create_table :texts do |t|
      t.string :content, null: false
      t.boolean :ready, default: false
      t.timestamps
    end
  end
end
