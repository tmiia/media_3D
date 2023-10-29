class CreateCommentaries < ActiveRecord::Migration[7.0]
  def change
    create_table :commentaries do |t|
      t.text :comment
      t.boolean :is_reported
      t.boolean :is_masked

      t.timestamps
    end
  end
end
