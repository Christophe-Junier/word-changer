class CreateWord < ActiveRecord::Migration[7.1]
  def change
    create_table :words do |t|
      t.belongs_to :text
      t.string :content, null: false
      t.timestamps
    end
  end
end
