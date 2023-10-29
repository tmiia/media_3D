class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.text :question
      t.string :label_1
      t.integer :count_1
      t.string :label_2
      t.integer :count_2
      t.string :label_3
      t.integer :count_3

      t.timestamps
    end
  end
end
